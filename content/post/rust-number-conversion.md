---
title: "Rust Number Conversion - Don't Follow the Book..."
date: 2021-12-30T15:35:58-06:00
draft: false
categories:
- blog
tags:
- programming
- rust
---

I'm at an intermediate level with the Rust programming language.  I've done a year of [adventofcode](https://adventofcode.com/), a medium-sized API server project, and little more.  While refactoring some code in my project recently I got rid of some of my explicit string conversions and let the type inference system and From/Into do their jobs.  Now that I'm more comfortable with reading code using From/Into patterns I think it's actually simpler - I can easily understand and trust what the type inference system does in those instances.  Before I had intuition about how the inference system worked, I didn't trust it.  I didn't know what it was doing under the hood.

Integer type conversion is not something I have intuition and trust in yet though, and I was refactoring some instances of that too.  Having gone through Rust by Example I am familiar with the [section on casting](https://doc.rust-lang.org/rust-by-example/types/cast.html), which recommends `as`.

Using `as` makes my hair stand up - today as it did when I first read that section.

Plenty of problems in C come from integer behavior that the programmer didn't plan for - overflows, underflows, negatives into positives...  I love C, but I came to Rust to get away from the problems caused by behavior like that.  A lot of those integer bugs lead to reading or writing memory out-of-bounds, especially via array indexing or similar action.

Memory problems are solved separately in Rust so I'm not worried about them much...  But integer conversion can be a problem even at software layers higher than those lowest-level memory accesses...  Consider pre-allocating resources based on the result of a conversion, or looking up a value in a database as the result of that conversion.  Calculating the wrong number due to a conversion bug can lead to users accessing data they should not, or to denial-of-service bugs.  It may be better that your program crashes than that it's pwned, but to avoid both is an even better outcome.

Conversion via `as` is what gets my hackles up.  When converting between types, if the result cannot be represented properly, `as` will give you back a valid result without complaint.  The result it provides is well-defined, which is great!  Your program keeps going and using that result.  However that result is (for practical purposes) incorrect.  The programmer must be on their toes to check for that incorrect result, or to otherwise avoid using it where an insecure state can arise.

Here's what I mean - the first line here is `u64::MAX` (the biggest unsigned 64 bit number possible), and the second line is it converted into each of the types listed there using `as`:

```
Orig: 18446744073709551615
As:   u64 18446744073709551615 u32 4294967295 u8 255 i64 -1 i32 -1 i8 -1 usize 18446744073709551615
```

Typically I expect bad/incorrect use of types to cause Rust to barf.  For instance - if I add 1 to a u64 set to `u64::MAX` at runtime, I get the following:

```
thread 'main' panicked at 'attempt to add with overflow'
```

Much panic!  Such wow.  I am duly reprimanded for adding 1 past the end of a u64.

This feels as safe as my mother's arms, compared to the same operation in C.  In Rust, trying to do this at compile-time doesn't even get past compilation.  This panic is the kind of behavior I'd expect from an Integer conversion method recommended in Rust by Example...  But that's not what we get - we get that mess above.

I expect Rust to do Integer conversions correctly by default, and to make it harder for me if I want to do something silly.

Contrast this with the TryFrom/TryInto version - I get a `TryFromIntError(())` trying to convert a big u64 into a spot where it can't fit.  I can handle that error, or pass it out to the calling function.

With TryFrom/TryInto I have a hard time ignoring my mistake - I have a hard time ignoring even the possibility of a mistake.

I love that.  It makes me feel so warm and secure and fuzzy.  Mother's arms.

Converting from a signed integer type into an unsigned type?  `as` will wrap it around, or give you 0, in some well-defined but mathematically incorrect and practically almost-useless way.  Using TryFrom/TryInto instead - you'll get a nice error.

I've done a reasonable amount of very low-level programming on a variety of architectures.  I know that wrapping integers is often exactly what we want in low-level code, and I'm thankful that Rust's behavior here is defined more simply than C's.  But I can't think of any higher-level programming I've done where I wanted integer wrapping behavior and I didn't implement it explicitly via a mod operation.

I would almost certainly choose to implement anything with a wrap explicitly, with mod, for readability reasons.  If I'm writing low-level code optimized for a specific use-case - ok I'll do the integer wrap and just use a comment so that I can help readability and keep performance.

Across all the times we change an integer's type, wrapping is almost never the desired behavior.  Wrapping is the unexpected behavior.  Most of the time we are not writing code that needs the performance of `as`, and even when code needs that performance at some point most of the code base does not.

## So What

The concept of `as` should be harder to type than two letters and two spaces.  And it should have a look/feel that screams at the programmer as they go scrolling past.

Using `as` should not be the main recommendation in Rust by Example - it should be in the annex.  From/Into methods and TryFrom/TryInto methods should be the default, easiest, and most-recommended way to convert integers.

Actually, the compiler seems to already feel this way a little.  Here's what it says when I try to pass an i32 to a function taking an i64.  Here we don't need the "Try" of course, because an i32 can fit into an i64 easily.

```
help: you can convert an `i32` to an `i64`: `(i32::MIN+1).into()`
```

I'm interested in opposing opinions!

EDIT: The first edition of the Rust Book recommended `as` for "safe casts", but the current edition doesn't seem to mention any way of converting numeric types.  I was mostly thinking of Rust by Example, as shown now.
