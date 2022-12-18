---
date: 2022-12-18 10:10:00-05:00
draft: false
title: Advent of Code 2022, Day 16
categories:
- Blog
tags:
- Programming
- Python
- Advent of Code
---

I'm doing Advent of Code 2022, and Day 16 was - in the parlance of our time - a doozy.  The problem presents a cyclic graph with each edge costing 1 second (weight of 1), and nodes have state (on or off), it takes 1 second to turn the node from off to on (default off), and when a node is on it contributes a certain amount of benefit each following second.  You have 30 seconds to get as much benefit as possible (function maximization).

> TLDR - dynamic programming didn't work for me, the graph was sized just-right for it to be computationally feasible to exhaustively search without many heuristics

So - ok, function maximization on a graph is a classic search problem in computer science.  Graph traversal - this is classic Dijkstra's algorithm or dynamic programming though - which is much more time-efficient if you can do it.

In Advent of Code there's usually a computational-time piece to the challenge - like, the sample input/output is computationally easy to exhaustively search, but the actual input is going to take until the end of the universe.

# Dynamic Programming Attempt

I started Day 16 much later than usual due to my work schedule, so I actually read it in the car after work, then went to the gym, then it was still several hours before I got to start.  In that time I decided I would try a dynamic programming solution to Day 16.  I figured - if I work backwards from the end of the time period, and generate the best solution for every node in the last second of execution, I could figure out the best solution for every node for the second-to-last second easily, and so on back to 30 seconds.  That seems like a lot of computation, but it's much less than searching all possible paths through all nodes including their state transitions.  Like, O(n) vs O(n^2) or worse.

Dynamic programming was not clearly the right solution.  After all - the on/off changes of the nodes add state I wasn't sure if I could account for properly, and the function we were maximizing doesn't clearly work when going backwards.  I wasn't sure how to prove to myself that dynamic programming would or wouldn't work - and I figured I might as well just try it and see what I get.

I spent about 5 hours trying to make dynamic programming work and it failed in the end, for this problem.  I was getting the correct outputs for the example inputs after about 2 hours, but I wasn't getting the right outputs in the way I expected.  I wasn't getting the correct outputs for my actual test inputs.  Getting the right answer in the wrong way isn't a good sign - I knew - but getting the right answer is so encouraging.  I tried to find the bugs in my implementation for the remaining hours, and I did find some ways to improve my solution and get closer to the right answer.

It was extremely difficult to debug the solution though.  Since I was getting the right answer-ish on the test cases I didn't have much to debug there.  The data structures were huge, and much larger and more complex on my actual test inputs, so that would have been very difficult to debug on.  Then, the path to solution was complicated too.

I briefly checked the solutions page on Reddit to see if anyone else used dynamic programming - I couldn't find anyone else, so it would be really impressive if I could get it working!

Eventually I decided my brain was fogged by lack of sleep, so I'd put off completing it until the next day.

# Function Maximization by Graph Search

The next morning I realized that I hadn't eliminated all the potential dynamic programming problems.  It still wasn't clear to me that the function maximization would work in reverse.  Perhaps it really was a dead end to use dynamic programming.

I would start again with just function maximization via graph search.  That's the technique that is guaranteed to work!  (For some values of "guaranteed".)

The open problems with this, for me were - how to represent the graph when nodes can change state, how to traverse the cyclic graph without wasting a ton of time on nodes that have already changed state, was this even computationally feasible given the size of the graph, and how would I represent the function to maximize.

I did see one mention on Reddit of someone that simplified the graph by eliminating nodes that don't contribute to the function we're maximizing (rate of 0).  By the next morning this idea had turned into the realization that I could simplify the graph even more by eliminating incoming links to those non-contributing nodes, and fully-linking all the other nodes with edges weighted by how long it would take to get to them previously.  With that, I don't have to worry about searching and traversing through the already-on nodes, because I can just go directly from on-node to on-node and calculate the change in time properly.

This was easy to implement as I had already done most of this in my old solution, although I started from scratch to avoid carrying over bad stuff.  I was also hopeful about the computational feasibility given that - everyone on Reddit was doing it this way, and there were many fewer nodes to traverse.

The solution worked quickly and correctly after that.

# Part 2 ... The Elephant in the Room

Part 2 of the problem, which is only visible after completing part 1, is to maximize the function again when two actors are traversing the graph simultaneously, and you get only 26 minutes.    After a little shock and horror, I thought, "no problem".  I will step 1 minute at a time (instead of search jumping by the weight of the edges), then add some function parameters to keep track of when the actors are transiting instead of turning things on or searching, and I will have both contribute to the "already been there" list and the score.

My first take at this was close to the right answer once I got the simple bugs worked out.  It was taking 40 minutes to run, though.  You basically have a search within a search, so instead of it being a depth of 26 it's like a depth of 52, and the space is already growing exponentially so it's disastrous for run time.  Now, I'm in Python, so that's not great at looping and recursing anyway.

I had two major cases I was not accounting for that caused me trouble.  Towards the end of the search paths there is only a little time left.  I realized that, if actor 1 was unable to find a search path he could try without running out of time then I wasn't letting actor 2 try to find a path.  There were probably paths she could try that would result in greater scores, but I was skipping them.  It took me a while longer to realize that I was doing the same to actor 1.  If actor 2 wasn't able to find a search path she could try without running out of time, actor 1 wasn't getting to try paths either.

Solving that problem required some ugly hacks.  I basically had to always give each actor a slot where they successfully "stayed still" and the other got to go.  This, again, expanded my run time though!  It's like adding an extra node, and one that never gets on (and therefore is never eliminated, always slowing you down).  I only needed it, though, if the search hadn't been tried, so eventually I added that check and that improved run time.

At around midnight I decided I better get some sleep, let the problem run on whatever code I had and hope I had the right answer in the morning.  My code was going to take 100 minutes to run.  When I put it in "pypy" instead of "CPython", run time dropped significantly, but I wasn't going to wait up.

This morning I had the (correct) answer waiting for me, and run time only took 20 minutes.

The part where AoC changed the graph-traversal time to 26 minutes was important, it turns out, because the computational complexity really explodes after that and it would take me forever in Python.

