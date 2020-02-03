---
title: "Syntax Errors"
date: 2020-01-29T16:15:37-07:00
draft: false
categories:
- blog
tags:
- programming
- python
---

Syntax Errors in Python are great.  Here's one:

```
  File "asdf.py", line 2
    print("Result is: {}".format(result))
        ^
SyntaxError: invalid syntax
```

```Python
result = ((5 * 10) + 15
print("Result is: {}".format(result))
```

Two lines of code...  Syntax error on the print line, evidently.  But where?  That line looks so simple and correct!  And pointing directly at the `t`?

Well - it's not really on the print line.  Folks who have done any amount of programming will look at the preceeding line fairly quickly and notice the missing parenthesis.

Right now, however, I have the privilege of teaching a bunch of programming newbs.  My classes are intro-level Python for general education credits.  So while some people have a bit of programming experience, many have never used a computer in this way before.

I remember some of my confusion from my early programming days.  The error pointing at the wrong line was always one of the most confusing things I'd see...  I've seen it so many times though, my eye often goes to the exact wrong thing I've done.

One of my early questions was, "if the error is actually on the previous line, why doesn't the compiler just point there?"  (I cut my teeth on old C++, when compiler was the right term.)  When some of my students ran into the syntax error problem, I wanted to answer this question for them.  I came up with the following description.

> Python raises a Syntax Error when it doesn't understand what you've said to it - when it's confused.

> This happens in real-life, among humans, too.  If you're having a conversation with someone, and they rattle off a whole paragraph very quickly, but you didn't understand the first sentence, it might be a few seconds before you get a chance to tell the speaker you're confused.  At that point, the speaker must consider that you didn't understand more than just their last sentence, and must repeat the whole paragraph more clearly.

> Because Python is confused about what you're telling it, it also may not understand exactly why it's confused.  It'll tell you the point at which it was certain it was confused, but you may have to consider that it actually got confused at some earlier point in the paragraph.

Actually - compiler and interpreter error messages are about 100x better than they were when I was learning.  My recent dive into Rust for the [Advent of Code](https://adventofcode.com/) made me really impressed.  I saw about a million errors per Rust compilation, mostly about borrow checking, but Rust's messages generally told me how to fix a problem.  That was impressive.
