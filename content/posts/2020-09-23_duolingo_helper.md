---
title: "A Duolingo helper to avoid skipping through corrections."
date: 2020-09-23T17:24:45+02:00
draft: false
---


I tend to go through [Duolingo](https://duolingo.com) lessons quite fast (if you do not know what Duolingo is, I recommend checking it out - it is quite a fun way to learn languages, and for free.)

This results in me usually typing in the sentences at my 80 WPM (well, the average is probaly less, but I'm trying to train it to be more consistent), then quickly smashing Enter twice to first submit the sentence, and then accept the "Correct!" message.

Sometimes, however, I make a mistake, and would like to read the correction before advancing further. Unfortunately, my monkey brain got trained to mash the Enter key twice to go as fast as possible to the next lessons. Aaand then I decided to fix that with my computer-y powers.
<!--more-->

## Solution

[A Tampermonkey script.](/content/duolingo-tampermonkey.js)

It is a simple userscript for Tampermonkey, which catches all the Enter keypresses, and works as follows:

* If you did the exercise correctly, the second enter gets you to the next one.
* If you made a mistake, the second Enter keypress is ignored, you can read the correction, and then press Enter again to advance.

## Installation

To install it you need to get the [Tampermonkey extension](https://www.tampermonkey.net), click on its icon, go to "Dashboard", then "Utilities", and you can paste the URL from below in the "Install from URL" field.

```
https://irth.pl/content/duolingo-tampermonkey.js
```

Enjoy!