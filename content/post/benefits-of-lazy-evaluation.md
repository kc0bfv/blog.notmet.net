---
date: 2022-12-12 08:56:00-05:00
draft: false
title: The Benefits of Lazy Evaluation
categories:
- Blog
tags:
- Programming
---

I was solving [Advent of Code](https://adventofcode.com/) this morning and generally thinking about programming when an event from my weekend struck me as an excellent example of the benefits of lazy evaluation.  Allow me to explain.

My wife is pregnant, and loves chewing on pellet ice.  You know, the kind from Chic-Fil-A or Sonic.  Well, it was Sunday and my wife was out of pellet ice, so it fell on me and the kid to go get some.

The process occurred in multiple steps.  Represented as a series of list comprehensions in Python, it might look like:

```python
sonic_locations = [loc for loc in get_sonic_locations(nearby)]
open_sonics = [loc for loc in sonic_locations if is_open(loc)]
with_ice = [loc for loc in sonic_locations if has_ice(loc)]
ice = get_ice(with_ice[0])
```

This is an example of "eager evaluation".

1. Use your mapping software to make a list of all the nearby Sonic locations.
2. Make a list of only the ones that are open.
3. Make a list of only those open ones that have ice.
4. Get ice from the first one in that last list.

If the functions `get_sonic_locations`, `is_open`, and `has_ice` are really fast, this is no big deal!  This will evaluate quickly.

Last Sunday though - I was driving around San Antonio with a two year old whose lollipop was almost gone.  Those functions were not fast - they involved me driving to the Sonic location, realizing that Google Maps thought it was open but it was permanently closed, Sonic's website thought it was open but it listed a wrong address and was anyway permanently closed, and then trying the next location.  San Antonio's north-side has lost a couple Sonics for some reason.

So - if I did eager evaluation last Sunday I would have:

1. gotten my Google Maps list of Sonics,
2. driven to all the Sonics, one-by-one, to determine whether they were open,
3. driven to all the Sonics again to determine if they have ice,
4. then driven back to the first in the list to purchase ice.

Obviously I did not do this.  The lollipop would have disappeared and the kid would have peed her pants, and I would have peed my pants too.  Nobody does this in real life except maybe psychopaths and private investigators.

Instead I used "lazy evaluation":

1. Ask Google for all the Sonics nearby.
2. Drive to the first in the list. (You ever try to call a fast food place? Don't waste your time.)
3. Determine if it has ice.
4. If it does, purchase the ice - done!
5. If it does not, go back to Google and get the second Sonic on the list, repeat.

```python
sonic_locations = (loc for loc in get_sonic_locations(nearby))
open_sonics = (loc for loc in sonic_locations if is_open(loc))
with_ice = (loc for loc in sonic_locations if has_ice(loc))
ice = get_ice(next(with_ice))
```

There's very little difference in the Python code that executes lazily vs eagerly - in this simple example.  This assumes that `get_sonic_locations` returns an iterator or a generator instead of a list or tuple or something, but it's my example so it does whatever I say it does.  And what's beautiful is that both Python examples work either way - it just has to return anything iterable.

The difference is in `[]` vs `()` - creating a list or a generator.  Python doesn't run any of those functions - `get_sonic_locations`, `is_open`, or `has_ice` - until it tries to pull the `next` out of `with_ice`.  Then it runs each *only* enough times to get that `next` from `with_ice`.

Now - both examples will throw an exception if there are no Sonics with ice, but that's basically perfect.  If they throw an exception I'll tell my wife that we have to wait until Monday or I'll start searching `!nearby`.

What actually transpired on Sunday is that I visited one Sonic that turned out to be closed, another Sonic at a wrong address, the third Sonic I was pretty sure was closed so I skipped it, then the fourth Sonic had ice (and french fries with one tater tot in there that really confused the kid).