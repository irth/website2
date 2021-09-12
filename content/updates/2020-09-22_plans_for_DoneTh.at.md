---
title: "DoneTh.at: the why and the future."
date: 2020-09-22T17:15:30+02:00
draft: false
project: donethat

---

As some of you might know (because it is on my main website), I have recently built DoneTh.at:

[https://doneth.at](https://doneth.at)

The reasoning behind the project is that I noticed that I often feel like I waste my time a lot or am unproductive everyday. Even though that is true sometimes, usually it's just that I quickly forget what I accomplished during the day, and unless I have been working on something all day, I feel like I didn't do much.
<!--more-->
So, I made a simple website that allows me to track what I accomplished each day. Each accomplishement has a difficulty value assigned, which allows me to compare days, have daily goals and draw graphs.

Originally, it was supposed to be an app that takes your TODOs from CalDAV or other services and draws a Github style activity graph based on how many tasks you complete. However, this had a few issues:

* CalDAV is a PITA to work with.
* CalDAV doesn't support hand written TODOs, which I'll switch to once I get my reMarkable 2.
* You need to plan for each task ahead of time, no easy way to get points for something done without planning.
* Lot's of edge cases when syncing.

Eventually, I came up with a cool domain name (DoneTh.at) and at that moment I decided to ditch the CalDAV sync idea and implement DoneTh.at instead.


## Future plans

### Storing dates for the accomplishements and day-start-hour customisation
First, I need to refactor the code to use dates without time, because time has timezones and I do not want to handle this.

The only point where actual time will be handled is when creating an accomplishement and then I'd like it to be as simple as possible:

* Get the time in the user's configured timezone.
* Get just the date from that timestamp, without hours.
* Check what hour the user considers "start-of-day".
* If the time is before, set the day to the day before.
* Otherwise, set it to the day from the timestamp.

Once the timezone and start-of-day hour is considered, the resulting day is saved in the database and I don't have to worry about the user changing the timezone or the hour later, as it won't affect historical data.

This also solves a problem where I didn't know what timestamp to associate with accomplishements created from the edit view, for previous days. I do not want to ask the user for the exact time, as they might not know it, and I want the UX to be uncluttered.

Allowing customising the hour that is considered the beginning of a new day would be useful for me and I'm sure for many others who also often do stuff in the night and go to sleep at 3 or 4 AM. The credit for the idea goes to the authors/contributors of GTimeLog which I got the idea from.

[GTimeLog - a very nice open-source time tracker.](https://gtimelog.org)

### Quests
Quests are kind of like TODOs - they are accomplishements, with associated difficulty, which you haven't done yet. You can add quests when you know you need to do something, and then when you eventually do it, just mark it as done and it is saved as an accomplishement.

I plan of adding two types of quests - one-off and recurring. One-off quests are ordinary TODOs, recurring quests are for stuff like "Practice Dutch" which you need to do every day.

I need to figure out how to add it without sacrificing the simplicity DoneTh.at currently has.

### Daily goal
Allow to set a daily goal, and then the app would track your streak and show you how much you need to do to reach the goal.

### Activity graph
Github style activity graph, but based on how much of the daily goal you did.

(The daily target would be, I guess, around 50% color value, as ideally you would reach it every day, and having the graph clipped at that value would result in a kinda boring graph.)

### Categories and advanced input parsing
Categories based on #hashtags in the accomplishement text. I also want to support changing the difficulty by writting stuff like "+30" in the input field.


### API
For apps and stuff. 

Currently DoneTh.at is 100% server-side rendered and works without JavaScript (it even mostly works with Lynx, except that it doesn't refresh after submitting forms, I'll need to fix that), and I think I want to keep it that way, but I'll see if I can extend it easily to support bearer token auth and JSON in requests and responses.