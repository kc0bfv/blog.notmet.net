---
author: finity
date: 2011-07-28 16:58:00+00:00
draft: false
title: Advanced SQL Injection
type: post
url: /2011/07/advanced-sql-injection/
categories:
- Blog
tags:
- sql injection leads to infection
---

Ok, here's a great blog post by Chris Shiflett about a crazy-creative SQL injection technique:
[http://shiflett.org/blog/2006/jan/addslashes-versus-mysql-real-escape-string](http://shiflett.org/blog/2006/jan/addslashes-versus-mysql-real-escape-string)

Very cool.  His technique relies on tricking addslashes into breaking up a two byte character with a slash, creating a valid two byte character followed by a valid one byte character.  He mentions that this (specific attack) is impossible with UTF-8 because all two (or more) byte characters have continuation bytes that start with 0b10.  Hrm.

Here's a thought that I need to do a little research on.  Where is the validity of a character checked?  Specifically this could cause a problem if the first byte of a UTF-8 character specifies a character length of, say, 3 bytes.  If, using the example of a SQL injection, nothing before the SQL server rejects a malformed character, then perhaps strange behavior by the SQL server's string handling functions could be used to trigger an exploit.  If the SQL server removed a malformed character from the string, then:



  1. The user could pass in some exploit in UTF-8 with one character malformed to have its last byte an ASCII apostrophe.
  2. PHP may addslashes or magic_quote that, mishandling the UTF-8 character just like in Chris' blog post above.  Instead of generating a valid character, as happens in Chris' post, it would generate a malformed UTF-8 character (similar to the user's input string) followed by an apostrophe.
  3. PHP would pass that along to the SQL server which would drop that malformed character, leaving the apostrophe.

So, this is really dependent on the behavior of the SQL server, which in many cases would be dependent on the underlying OS' behavior.  I guess that's what I need to research - what do underlying OSes do with these multi-byte characters?  What do the standards say that they're supposed to do?  How could I build the chain of servers/clients such that this malformed character is passed to the SQL server and it benefits me?

---
### Comments:
#### 
Karl - Jul 0, 2011

Malformed char right before an end of string null...
