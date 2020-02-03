---
author: finity
date: 2012-12-19 21:06:28+00:00
draft: false
title: Bash Dictionary - Terrible Hack of the Day
type: post
url: /2012/12/bash-dictionary-terrible-hack-of-the-day/
categories:
- Blog
---

So, I just had a reason to implement something like a dictionary in Bash.  Of course, I could try to determine if such a feature exists already (it does in Bash 4, alas the default on OS X seems to be 3.2), but why not just try to hack something together?

Here's what I got initially:


```
OFFSETDICTkeyUno=5
OFFSETDICTkeyDos=4
OFFSETDICTkeyTres=17
OFFSETDICTkeyQuatro=21
keyToLookup="keyQuatro"
value="$(eval echo '$OFFSETDICT'${keyToLookup})"
echo $value
>     21
```


So, that's ridiculous.  Basically, the values are set in code with the dictionary name "OFFSETDICT", and the key as whatever comes after the name {keyUno, keyTres, ...}.  Then the value line builds a variable lookup and executes it.  That's pretty lazy of me to write it like that, so here's a function (a Bash function - so terrible).


```
function get {
dictName="$1"
key="$2"
CMD='$'"${dictName}${key}"
echo $(eval echo "$CMD")
}

a=`get OFFSETDICT keyQuatro`
echo $a
>     21
```

Hrm, I wrote a getter, I should probably make a setter too.

```
function set {
dictName="$1"
keyName="$2"
value="$3"
CMD="${dictName}${keyName}"='"'"$value"'"'
eval "$CMD"
}

get OFFSETDICT keyCinco
>
set OFFSETDICT keyCinco "Sup my man?"
get OFFSETDICT keyCinco
>     Sup my man?
```

You can imagine what this does to the variable space.  But if you're really worried about that, maybe don't use Bash.

I really just needed to look up one value based on another value.  I guess an array would have worked, but that's not much of a stupid hack.

---

### Comments:
####
finity - Dec 3, 2012

My use of eval here is truly the terrible part. If an untrusted user can supply any of the parameters that eval touches, that's a very easy injection attack. I have no reason to run this code with any permissions other than the untrusted user's, though, so this should be fine.
