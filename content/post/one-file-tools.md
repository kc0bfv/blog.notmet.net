---
title: "One-File Tools"
date: 2020-03-26T15:20:15-06:00
draft: true
categories:
tags:
---

Many of us use computers that are locked-down by some corporate policy.  The restrictions prevent you from downloading software, or running anything that's not pre-approved.  Most of us have used workarounds of some type - Excel spreadsheets created by that one guy in the office, Word documents with macros, Sharepoint sites, maybe even the occasional Powershell script...

> One-File Tools are open-source self-contained one-file utilities implemented as a webpage.  These are easily shared, easily used, their saved versions may contain your user data.  They don't require an Internet connection.

<!--more-->

The documents you view in your web browser include HyperText Markup Language (HTML), JavaScript (JS), and Cascading Style Sheets (CSS).  Three languages that tell your browser about file contents, how to manipulate them, and how they should look on-screen.  These can even be packed into one file, but for development purposes they're often kept separate.

JS is hugely flexible these days.  The language has gotten a huge number of additions and improvements over the years, and they're widely supported by at least one browser on your computer.

Locked-down computers nearly always permit opening an HTML document stored on your computer.  Generally they can be transfered over the corporate network too.  This opens up the possibility of using HTML documents with embedded JS and CSS as more general-purpose tools.

One important use case for this type of tool is in handling sensitive information, especially on networks that aren't connected to the Internet.  Generally, in these cases you're stuck using a very limited set of tools.  You cannot use general Internet tools because you need to protect the [CIA](https://en.wikipedia.org/wiki/Information_security#Confidentiality) of your data.  Or, you cannot use general Internet tools because you don't have easy access to them.

## Examples

This type of utility has been around a long time, but until recently I've not seen any that do more than small tasks.  The first serious one-file tool I came across was TiddlyWiki.

### [TiddlyWiki](https://tiddlywiki.com/)

This is a - well, [they put it pretty well](https://tiddlywiki.com/):

> TiddlyWiki is "a unique non-linear notebook for capturing, organising and sharing complex information."

[Wikipedia says](https://en.wikipedia.org/wiki/TiddlyWiki):

> TiddlyWiki is a personal wiki and a non-linear notebook for organising and sharing complex information. It is an open-source single page application wiki in the form of a single HTML file that includes CSS, JavaScript, and the content.

I've used a wiki for personal and group note-taking, for organizing documentation for myself and a team, and for keeping track of other random information for teams and groups.  They're easy to use, easy to edit, work across platforms (because they're in the browser), and can flex for any task.

Most wikis require a database somewhere in the "cloud", and server-side execution of code (PHP, Python, Ruby...  JS - something).

TiddlyWiki requires only one HTML file.  That's it.  Share it around via email, Dropbox, network share, git server, whatever.  Saving it downloads a new version of the HTML file.  You can also save the wiki to a remote server or database, but that's not necessary.  It's easy to create new notes in it and link between them.  Changing settings and display options is simple, and even adding JavaScript to automate things is fairly easy.

### [Relationship Graph](https://kc0bfv.github.io/relationship_graph/)

This one's not nearly as cool as TiddlyWiki, but it is my creation.

Relationship Graph is a generic graph creation and sharing tool.  I built it to describe relationships between people, teams, and projects that I encountered.  I also use it to keep track of references for two papers I've been writing (slowly, so slowly).  It can be used to represent any graph though...  Another use case that's come to mind is for call rosters - like a recall roster teams might use to get in touch with their members in an emergency.

The entire tool is contained in one HTML file, as is the graph data.  Saving the file causes your browser to download a new copy of the tool with your current data in it.

### [PDF Combiner](https://kc0bfv.github.io/WASM-PDF-Combiner)

This one isn't quite done yet - the interface is rough and it's not yet in one file.  Actually, I'm not sure it's possible to put into one file.

Some breaucratic offices I've worked in require submission of multiple documents as one PDF.  Nevermind the fact that they've not provided any easy way to accomplish that.  The files that need to be combined are generally sensitive privacy act information, too.  They expect folks to print documents, find a scanner, and scan them all back in.

This has always wasted my time.  Some versions of Adobe Acrobat can combine PDFs...  I generally only had access to the free versions though, which don't do that.

This tool uses Web Assembly (WASM) versions of ImageMagick and Ghostscript to combine PDFs.  It's just a webpage though (currently with separate JS and WASM files).  It can be shared easily across filter devices and software.  It can run offline.

Most importantly - the files never leave your computer.  It is therefore suitable for handling sensitive documents.

### File Encryption

[Meixler-Tech](https://www.meixler-tech.com/web-browser-based-file-encryption-decryption.html)

I haven't tried this utility out, but it looks legit - this page encrypts files using AES, based on a password.  It provides command line equivalents for the encryption operations, and the operations seem reasonably secure.  It uses the WebCrypto API.

I think a more flexible encryption tool should be possible easily using crypto.js, and may work on one if this lockdown continues too long.

A useful modification, for instance, might be to save encrypted files as an HTML document with decrypter.

[This tool](https://github.com/sh-dv/hat.sh) looks good too, but the download doesn't look like it'll be just one file...

## Constraints

One major constraint with this type of application is with multi-user editing.  I haven't seen that implemented yet.  Files must get shared around, then someone has to reconstitute changes, combining the resulting files into one.  Some kind of automated combination feature should be possible in many of these tools.

## Feedback

If you're reading this and you know of additional tools like this, I'd love to hear about them.  If you have a use-case that would benefit from a tool like this, I'd be interested to hear about that too.  Also - feedback about the software I wrote here.  I'm on Twitter, and Github - open an issue or tweet at me.
