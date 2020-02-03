---
author: finity
date: 2019-02-07 02:27:44+00:00
draft: false
title: Writing About Writing Secure Shell Scripts
type: post
url: /2019/02/writing-about-writing-secure-shell-scripts/
categories:
- Blog
---




I recently read this cautionary tale about shell scripts.  [https://www.linuxjournal.com/content/writing-secure-shell-scripts](https://www.linuxjournal.com/content/writing-secure-shell-scripts)







It's cautionary in two ways: it is intended to cause shell programmers caution, and I caution against you taking the article too seriously.







One of the biggest threats to the shell in memory was the Shellshock vulnerability.  This wasn't typically a direct threat to shell scripts, but one caused by a bug in a shell, and by other programs exposing parts of the shell to external input, often in unexpected and unlikely places.







That kind of topic is not what the Linux Journal article is about.







Instead, it provides three cautions to people writing shell scripts:





  * Know the utilities you invoke: fully specify program paths so you don't accidentally run something out of /tmp  * Don't store passwords in scripts: find your own other solution, good luck sucker!  * Beware of invoking anything the user inputs: with examples that work on no modern Linux





These are all fine recommendations, but are made in terrible ways.







## Know the Utilities You Invoke







The author provides an example where a user drops a malicious "ls" script in /tmp, then scripts execute it because they do not completely specify the path of ls.  The author's recommendation is to completely specify all paths.  The problems with this are two-fold...







First, to execute a program in a directory that isn't in your path, you must specify the path of that program.  If it's your current directory, that's just a "./", but it still must be present.  If you have "." in your path, as the article suggests, then you have made a configuration error that can easily cause you unexpected behavior at best, and the precise security vulnerability mentioned in the article at worst.







The correct remediation for this issue is to not put "." in your path.







The second problem with the article's recommendation is that many programs are not in a set location on the system, and some even move around over time (decades).  Many claim that the "/bin", "/usr/bin", "/usr/local/bin" system is set, sensible, and regular.  This is not the case in practice.  Usage varies between distros, and even between versions of distros.  A system update can move the location of a program in the worst case.  This isn't a problem if the new location is in your path, you'll still execute the right thing.  Unless you fully specified the old location in all your scripts.







This isn't to say that you can't usually specify the full location.  And specifying the full path might provide a greater security guarantee.  However, the author's recommendation has some practical downsides, and anyway don't put "." in your path!







The [great /usr merge](https://freedesktop.org/wiki/Software/systemd/TheCaseForTheUsrMerge) makes fully specifying paths more practical.







## Don't Store Passwords in Scripts







This is 100% correct.  Anyone with read access to your scripts or your git repo or your backups can pull those passwords right out.  The problem with this section of the article is that it doesn't provide any practical solutions.  Anybody that has been doing shell scripting for a time will have run into the password problem, and lots of us have just crammed the password in the script or in a readable file at some point.







There are other better solutions!







First though, another wrong way to do it: specifying passwords on the command line or in environment variables.  Don't do this either!  It often seems a better solution than dropping it in the code, but both solutions still expose passwords in many ways.







If your need is for SSH (or related) authentication, consider requiring the script user to type in the password.  The password is a way to ensure the user actually has permission to use the resource you're automating access to.







Often, scripts need to run without user interaction though, so entering a password is not feasible in those cases.







Then you need to limit the damage someone malicious can do if they gain access to the target system.  Consider setting up a specific user on the target system that has permissions limited to only what is required for the automated actions.  Setup key-based access to that target account, don't specify a key file password, and don't provide the target account an actual system password.  Place the key file in a location only accessible to the users that should be able to execute the script (maybe you need a custom user or group here, too) and give the file only the minimum required permissions. Now, in your script, invoke SSH, or SCP, etc. with that key file specified.







Using SSH-Agent is probably an even better solution: [https://www.akadia.com/services/ssh_agent.html](https://www.akadia.com/services/ssh_agent.html)







What if it's not SSH that you're sending a password to, what if it's sudo?  I think we've all wanted to do this at some point, I confess that I have.







Don't do it though!







Change your sudo configuration so that for the specific command you need a specific user to run, it doesn't require a password!  Then lock access to that user down some.  Even in this case, you're probably causing problems you don't expect.  Imagine if the target executable has a vulnerability…  Now you're opening the aperture for privilege escalation. A better solution is to change permissions to allow specific users access to the specific resources required, then reduce others' access to those user accounts.







What if you need to script password sending to telnet or ftp?  I don't have great solutions at hand for you.  At some point you may need to put passwords and usernames in files, then limit access to those files, and have your script grab the file contents.







## Beware of Invoking Anything the User Inputs







The author suggests that a specific setup and command line can cause, "quite dire consequences." Try this command for yourself though, after changing the "rm" command to something benign like a version of "ls".







You didn't get the output the author suggested you might?  That's because this isn't really a problem the way he states it.







Oh, the author's "eval" version might work, but when have you ever written code like that?  Please say you haven't.







It's definitely possible to accidentally provide ways for users to cause command injection - it's a very common class of vulnerabilities.  Scrubbing the input, as the article author suggests, is a common solution.







One recommendation the author should have made more clear is that when scrubbing input you should permit only data that fits a minimalist whitelist.  Don't try to look for bad characters, like you would with a blacklist…  Instead, fail on any characters that aren't in your specific small set.







More often though, the use case for shell scripts is in accepting input from users already on your system.  In this case, the recommendations in the article are lacking.







My main recommendation is to avoid permitting users to run anything as a higher level user, or as a different user at all.  If users can only execute scripts as themselves, and the script doesn't grab extra permissions like via SSH, any commands the user might try to get the script to run would also run with the user's permissions.  Therefore, it's a thing they could've done themselves.







If there are shared resources the script needs that the user shouldn't normally have, perhaps use sudo within the script to grab/use those resources then drop permissions (as would happen if a separate program did the permissioned work, then ended).  Alternatively, create another user with only minimal permissions, including those shared resources, then have the script run as that user.







If the script does have to get extra permissions, like through SSH, avoid sending user input there, or sanitize it with a whitelist (worst case).  When I say SSH provides extra permissions, I mean that it does so by providing access to another computer, and potentially another user.







You should try to avoid writing code that eval's user input, or potentially places it on the command line as multiple arguments, and you should try to sanitize input when you have to take a risk...  But the best solution is to design the environment so that even when you inevitably mess up it's not that big a deal.







## Conclusion







Good points Dave, but the recommendations are lacking.







The Apple article he links has better recommendations, and solid examples.  It points out that older Bash versions were vulnerable to one of Dave's examples that I poo-pooed.  However, there are many problems with running older Bash versions (you wondered why I mentioned Shellshock?)…  Don't do that anymore.  The Apple example also has a great hidden eval command in there - echoing user input to a file then executing the file is essentially eval.  Avoid.



