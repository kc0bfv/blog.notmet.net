---
title: "Reflections on Teaching Intro to Programming"
date: 2020-05-07T14:11:08-06:00
draft: false
categories:
- Blog
tags:
- Programming
- Teaching
---

Over the last semester I had the pleasure of teaching programming as an adjunct professor at a local major university.  I sought out this opportunity because I genuinely enjoy teaching, I knew I'd have a little extra time on my hands, and I think it's valuable to my current assignment to be in the community putting a face to the Air Force.  I cold-called the computer science department and asked around just prior to the fall semester, and they were interested in bringing me on for the spring semester.  More than that - they wanted someone to turn their existing Intro to Programming (in Python) course into an Internet-based course.  Python is my jam, so this sounded good.

{{< fig-res res="1024px-Python_image.jpg" alt="Python code on a computer screen, from https://commons.wikimedia.org/wiki/File:Python_image.jpg" caption="Python lookin sharp." >}}

I learned a lot while teaching this class, about teaching, about students, about learning Python, and about learning programming in-general.  I wanted to put my thoughts down because they've been bubbling around in my head.  I think this would be a great talk topic for some nerd conference too, so it makes sense to take the notes while they're fresh.

<!--more-->

I really did have a blast teaching this class.  It was more work than I expected, but not crazy.  I would not sign up for this commitment during a normal assignment, for instance.  Unfortunately I didn't get as much face-time with students as I wanted.  This was only partly because of COVID-19, but primarily due to teaching remotely from a location different than most of my students.  My favorite class periods are those where the students are answering questions, asking questions, and generally having fun.  There was significantly more of that when I was physically located in the room with the students.

## The Perils of Internet Teaching (or: an opportunity for a solution)

The Internet really enabled me to teach to multiple campuses in different cities, and the university's setup was seamless and easy to use.  After COVID-19 struck, the Internet allowed us to continue teaching in much the same way we had before.

However, over time fewer and fewer people showed up to class.  Since we were recording lectures as video, perhaps students didn't see a benefit to attending class vs. just watching the video later.  Perhaps the time (0800) caught up to folks and started affecting attendance.  Perhaps there's just some human bias that makes people feel more like their absence will be noticed when they skip an in-person class.  Whatever the issue, this is always disheartening.  The students that stopped attending class also slowed on submitting their homework/projects.

Internet courses also make it very difficult to get facial feedback from students.  Whether you're being broadcast from a classroom into a remote classroom, or teaching directly over Zoom, it's much harder to catch body language and facial feedback over video.  That makes it harder to determine when folks are lost, or bored, or interested, or playing on their phones.

I prefer to teach in-person.  Next time I teach an Internet course though, I might consider taking attendance each period, or requiring webcams to be on at least part of the time.  I think this is really something we will need to improve in general, before Internet course delivery can be a more general-purpose solution.

## Record Lectures and Label Them Immediately

I mentioned that we were recording lectures as video - this was fantastic.  It doesn't eliminate peoples' need to take notes, but it means that they can refer back to anything that happened during class to get a refresher on exactly what I said or what they asked.  It means that if they take notes which are confusing, they can jump back into the video to see why they wrote what they did.  I was able to post the automatically-recorded videos to our course Moodle about 24 hours after they were recorded.

One thing that would make the recordings more useful would be labeling them with the topics covered, or maybe the topics PLUS the slide range covered.  That way students can more easily jump to the topic they're interested in.  Future classes and instructors could determine which videos were applicable, or comparable to their current schedule, without having to download and peruse each one.

Labeling videos with topics takes only a minute when the course is fresh in your mind, and it's helpful anyway so that next class period you can pick up where you left-off.  Trying to do so when the class period is stale in your mind can take a long time.  In the future I would label the videos immediately.

## KISS (Keep It Simple for Students) Projects

Each week of our course came with an assigned project.  These were problems that we intended students to take an hour or two to solve, that would require them to use the week's material creatively, and thus they would demonstrate serious understanding of it.  These projects were in addition to a set of exercises we hosted on a website called Phanon.  Phanon had exercises that slowly got students used to a particular topic.  They'd begin by fixing small pieces of code that they were directed to fix.  They'd work through having to figure out the changes themselves, then eventually they would write short bits of code.

Projects were significantly harder than the exercises.  They initially came with an auto-grading script which was invisible to students, and by the end they came with an auto-testing script which was completely open to students.

The first weekly projects were fairly simple, and the last one wasn't too difficult, but several of the middle projects were too hard for students.  The complexity shot up in a way that I hoped students would handle well, but integrating all the pieces they were learning was harder than I expected.  The projects for an introduction to programming course need to be fairly simple throughout.  They should largely test the newest topics in only a simple way, and require use of earlier topics in a ramped manner.  Oldest topics should be used most, newer topics used less.

The other instructor suggested a rule of thumb - if I cannot complete a project in 20 minutes, the project is too difficult for students.  I think this is right-on, but we also need to be cautious about requiring students to integrate many different topics.  That task is significantly easier for an experienced programmer, and exponentially more difficult for students as the course goes on.  Their thinking often seems to be - I have `n` topics that we've learned so far, how should I make those `n` topics interact in this project?  That can make thinking about solutions an `n**2` proposition for them, whereas for someone used to seeing the needed solutions the space is `1`.

## Prerequisite: Reading Comprehension

One of the main issues with students completing projects was that some of them seemed to lack the required reading comprehension skills.  Some asked questions about not understanding what a given project was asking - and at some level I expected this.  It's not always clear what the end goal of a project is, or how the teacher intended it to work.

However, many students were unable to take a paragraph explaining what a function was supposed to be named, and what it should take as parameters and return, and understand it long enough to code the outline.  I watched some read a sentence repeatedly, and afterwards not be able to answer questions directly from the lines they were reading.

A programming course needs to emphasize more than just algebra and basic computer usage as prerequisites - reading comprehension is hugely important.  I would not have put reading comprehension as a prerequisite before teaching this course, but now I can see how critical it is.  So much of programming is reading, students that don't have an ability to retain and understand what they're reading will have little chance of programming effectively.

Previously I thought that anybody could learn to program.  I would say now that anybody with moderate reading comprehension skills can learn to program.

## Auto-grading Considered Harmful

Our auto-grading system was intended to help students out by immediately giving them feedback.  Unfortunately, I found that it often confused them, and caused them to struggle for hours against a last eccentricity instead of just stopping.

The system we were using for auto-grading was designed to run student code and record the output, and allow inspection of code as a string.  I bent it to also be able to supply input and interact with the running code, and to be able to call student functions or instantiate student classes.  These are all things instructors need to do when grading student work.

However, instructors can be much more forgiving than code when verifying student outputs and inputs.  The original system worked by telling students that specific inputs must contain a specific word, looking for that word as part of the `input` call, then supplying a value in return.  Students need to input a quantity of potatoes to do math on?  Tell them to include the word "potato".  Some students used `print` to provide the prompt, some spelled `potato` wrong...  Perhaps both of these should result in points being deducted, but unless the auto-grading script developer considered them then students would just get an unusual error, and would be stuck.  My scripts anticipated such problems by printing "I DON'T KNOW WHAT INPUT TO SUPPLY HERE" when encountering strange inputs.

Students need to output a total price?  I might have told them to make sure the word "price" was in the output.  Now - did they supply that word as a different print statement or on a different line, or did they add in a dollar sign, or did they put commas between thousands and millions, or were they off by just a tiny amount?  If those cases are not handled correctly students would again get confusing output from the auto-grader.

With confusing output - some students would debug their program to solve the issue, others would email me to determine what was happening, but too many just spent hours banging their head against the computer.  The auto-grading was largely counter-productive.  I'd much rather students just turn in something that mostly-works and move on.

The auto-testing system provided similar feedback but checked results more loosely, and it didn't tell students when their project was complete.  It only ran programs through some paces and gave them feedback.  If students got confused about a particular error they could check the tester code, which was in simple Python, and try to debug.

I believe the auto-tester largely solved the head-on-keyboard issues, but I know many people still had trouble understanding just how they were supposed to use it, and others had trouble understanding where the line between their code and the tester was supposed to be.  I think even the auto-tester was a crutch folks leaned on inappropriately.  In the future I'd still want to provide something that supplies student code with inputs and checks outputs, but I would make it much less regimented.  For student code involving function calls, I'd probably require the tester to run against a student test script.

## Final and Midterm Projects, not Tests

The midterm and final exams both required lots of code writing.  On the midterm, we actually required students to write code on paper.  On the final we had them type it, but they had no way to run their code.  This is not a useful skill for a programmer, and I don't think it makes sense to test this way.

{{< fig-res res="students-3835935_1280.jpg" alt="A young boy cradling his head in his hands, clearly frustrated, with a sheet of paper in front of him and having written few words on it.  From https://www.needpix.com/photo/download/1758180/students-learn-education-study-children-books-person-literature-read" caption="Writing code on paper accomplishes nothing except tiring your hand" >}}

It does make sense to test students' coding though, instead of multi-choice or short answer questions.

I'd definitely institute midterm and final projects, which students might complete in a test environment but for which they'd have access to normal Python tools.  I'd choose a difficult problem they hadn't experienced in class before, then give them one or two hours to complete it.

## Teaching Software Development, or Problem Solving

When the course was nearly complete I realized that we had really missed a major topic: how to design a software system.

Each of our projects required some of this skill - we never specified a project so specifically that students didn't need to figure part of this out.  The project difficulty in this respect ramped up in difficulty as the course went on...  Our first project was nearly completely specified in English language, the middle projects specified function inputs and outputs, and by the end we only gave students broad strokes of how the software was supposed to work.

The projects I completed in class permitted me to talk-through how I go about designing a piece of software.  I would tell the students what I wanted to accomplish, show them how I broke the problem down into chunks of code delimited by functions or comments, then start to fill in things slowly and test continuously.  I would ask them for inputs along the way, and incorporate their suggestions regardless (usually) of how I initially saw the solution.

There's no chapter in the textbook about program design though.  There was, therefore, no specific lecture about how to decompose a problem and design a solution.  The textbook, and therefore each of our lectures, covered syntax, control flow, and data structures.  It was on the teacher to convey problem solving methodologies.

The textbook did have sections about debugging, and how to avoid it.  These sections were very close to a programming design section.

The exercises and labs in the textbook would have required self-learning of program design skills.  As did our projects.

I asked the other instructor about this missing chunk - and pointed out that I haven't actually seen a topic like that covered in a programming textbook.  His strategy for teaching it mirrored mine.

This missing piece disappoints me because I believe it's the most life-applicable thing students can learn.  Programming courses expect that students will go on to be programmers, or will at least require the skill of programming periodically.  But in general they will not.  Few students will go on to ever program in Python again.  Everyone has to use problem solving in their daily life.  Everyone can benefit from the ability to think abstractly about a problem, to empathize with a humbler state like the simpleton a computer is, and to break problems down into pieces.  This is the real benefit everyone can gain from learning to program.

In the future I plan to incorporate program design much more purposely in an intro to programming course.

# Lessons Learned

I guess I'd summarize my lessons learned from most important to least as:

- Program design is not well-covered by introductory programming courses and materials, but it is the most important skill a programming course can help develop
- Reading comprehension is vital to programming, and is maybe one of the few hard requirements a programmer must possess
- Use midterm and final projects, not tests
- Teaching in-person is best because body and facial-language feedback is vital
- When teaching over the Internet, consider requiring attendance and webcams on at least a little
- Label recorded lectures with the topic and slides covered, and do it right away
- Make projects easier for intro students, and especially be wary of integrating topics
- If a project takes me more than 20 minutes it is too hard
- Auto-grading with instant student feedback was largely a negative for students, but some auto-testing can still be good
