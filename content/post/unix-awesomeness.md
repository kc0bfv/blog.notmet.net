---
author: finity
date: 2013-02-04 17:00:16+00:00
draft: false
title: Unix Text Editing Awesomeness
type: post
url: /2013/02/unix-awesomeness/
categories:
- Blog
---

Oh, LaTeX acronym package, you won't automatically alphabetize my list of acronyms?  Strange...  Let's see if Unix will...

```
$ echo "\acro{SCADA}{Supervisory Control And Data Acquisition}
\acro{PLC}{Programmable Logic Controller}
\acro{RTU}{Remote Terminal Unit}
..." > toSort

$ for i in `cat toSort |sed "s/.*\\acro{\(.*\)}.*{.*}/\1/" | sort`;
do grep "{$i}" toSort; done
\acro{ADC}{analog to digital converter}
\acro{API}{application programming interface}
\acro{APT}{Advanced Persistent Threat}
\acro{ASCII}{American Standard Code for Information Interchange}
...
```

Unix, you rock my world.

---
### Comments:
####
Kevin - Feb 2, 2013

Ha, nice! Is the sed part necessary? I see that you're sorting by the acronym name, but since they all have the same prefix, wouldn't a straight sort work too?

---
####
finity - Feb 2, 2013

Dang! You're exactly right. I didn't think of that...
