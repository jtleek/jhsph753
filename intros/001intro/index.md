---
title       : January 29 intro
subtitle    : JHSPH Biostatistics 753 - Advanced Methods/Applied Statistics
author      : Jeffrey Leek, Assistant Professor of Biostatistics 
job         : Johns Hopkins Bloomberg School of Public Health
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : zenburn   # 
widgets     : [mathjax,bootstrap]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---

## January 29

__Announcements__

__Agenda__

1. Talk about pre-assignment

2. Structure of a data analysis

3. In class-exercise on pre-assignment

4. Paramters and randomness (unlikely today)

---

## Pro-tip: Reproducible research

Reproducible research is a hot topic, in part because a couple of high-profile papers that were disastrously non-reproducible (see ["Deriving chemosensitivity from cell lines: Forensic bioinformatics and reproducible research in
high-throughput biology"](http://arxiv.org/pdf/1010.1092.pdf)).I also have pretty strong feelings about the subject (["Statisticians and computer scientists - if there is no code, there is no paper"](http://simplystatistics.org/2013/01/23/statisticians-and-computer-scientists-if-there-is-no-code-there-is-no-paper/)) When you write code for statistical analysis try to make sure that:

1. It is neat and well-commented - liberal and specific comments are your friend

2. That it can be run by someone other than you, to produce the same results that you report. 


---

## Paper of the day

["Empirical estimates suggest most published medical research is true"](http://arxiv.org/abs/1301.3718) 

See also

1.[MIT Tech Review](http://www.technologyreview.com/view/510126/the-statistical-puzzle-over-how-much-biomedical-research-is-wrong/) 

2.[Andrew Gelman](http://andrewgelman.com/2013/01/i-dont-believe-the-paper-empirical-estimates-suggest-most-published-medical-research-is-true-that-is-the-claim-may-very-well-be-true-but-im-not-at-all-convinced-by-the-analysis-being-used/)

---

## What you know about me

<img class=center src=assets/img/carrie.png height='80%'/>

---

## What you know about me

<img class=center src=assets/img/fortin1.png height='80%'/>


---

## What you know about me

<img class=center src=assets/img/fortin2.png height='80%'/>


---

## What you know about me

<img class=center src=assets/img/fortin3.png height='80%'/>

---

## What you know about me

<img class=center src=assets/img/emily1.png height='80%'/>

---

## What you know about me

<img class=center src=assets/img/emily2.png height='80%'/>

---

## What you know about me

<img class=center src=assets/img/vivek.png height='60%'/>

 Attached is a daily time series of your family's total spending activities for the last few months. It appears that you and your wife spend money in a punctuated fashion; at least three distinct peaks of major expenditures are visible, corresponding (roughly) with the holidays: 10/29 (~Halloween), 11/26 (~Thanksgiving), 12/31-1/02 (~New Years) ; in at least two occasions these expenses are for airfare.  
 
---

## What you know about me

* You traveled to London. Departed on the 9/27/2012 and returned on the
10/02/2012.
* You have a Daily Grind card
* You are subscribed to Net
ix
* You have Kindle
* You like Indian food
* You spent Christmas and New Year in Maryland, but early this year the family spent 5 days in Florida.

---

## What you know about me

* Card 4 is only used for shopping at Target
* Card 1 is frequently used in Baltimore (could be Jeff's)
* Card 2 is seldom used in Baltimore (could be Jeff's wife's)
* Card 3 is rarely used

The Wholefoods shopping is always done by Card 2. (which means Jeff's wife is always doing grocery shopping, or they are doing it together while his wife always pay for that.)

---

## What you know about me

<img class=center src=assets/img/john.png height='60%'/>

* There seem to be high spikes in the amount of spending (over $500) in Late October, Late November, and Late December.


---

## What you know about me

<img class=center src=assets/img/john2.png height='60%'/>


---

## What you know about me

* It seems that you may use Card 1 and 2 for large amount of purchase, but not card 3
and 4. Then, I make scatter plot to investigate more details: you frequently use Card 1 and 2, the
pattern of Card 1,2 are similar; however, Card 3 and 4 are seldom used.
* So, Card 4 must be the membership visa card of TARGET, but I have no idea of what is Card
3 though.

---

## What you know about me

<img class=center src=assets/img/yuting.png height='60%'/>

---

## What you know about me

1, I guess the first card is yours, and the second card is your wife's card.

2, I guess your home address is near the cross of West street and Taylor Ave, Spa Rd, in Annapolis

3, I guess you made several donations with total amount $4300 on one day 1/2/13.

---

## What you know about me

. Home Location

Apparently your family live in Annapolis. I was trying to figure out the approximate location of your home, but I stuck and didn't have more time to do this.

2. Family Status

According to what you said during Lecture 1, there are three people in your family. You, your wife and a baby. The fact that you have a baby can also be verified based on multiple transactions made at CARTER's.

---

## What you know about me

There are four credit cards in the statement. Obviously Card No. 1 belongs to you (based on a lot of weekdays' transactions in Baltimore) and Card No. 2 belongs to your wife. Card No. 3 is used only at iTunes and EZPass refill. Card No. 4 is a Target Redcard, which is used by both you and your wife. The card was used at United States while you were away in London and used in Seattle while your wife was back in Maryland.

---

## What you know about me

Your wife works at the Naval's Academy, which could be easily verified by the fact that Card No. 2 is associated with a lot of transactions of food (i.e. bagels) at that location.

3. Transaction Summaries

Apparently you love Amazon.com! You buy a lot of things at Amazon.com and you also use the Amazon Web Service. What interests me the most is, how are you feeling about Ting's service? Signal? Voice call quality?


---

## What you know about me

4. Traveling History

You traveled to several places during this period. The first one was London, which was between Sep. 26 and Oct. 2 (based on Parking at BWI, you paid $132 for 6 days at the hourly garage). The second one was Houston (via Charlotte) between Nov. 16 and Nov. 18. During Thanksgiving, you basically stayed home and made a big travel plan for the New Year. After the Christmas, you first flew to Seattle on Dec. 25. You took the Target credit card with you. Based on the parking at BWI, you came back on Dec. 29, which was $110 for 5 days. But it is unclear to me why there were transactions in Seattle posed on Monday. It may be due to the delay in the weekend. After Seattle, you flew to Panama City in Florida for another holiday possibly on Jan 1. You stayed for about 5 days and came back on Jan 6.


---

## Summary

* Lots of interesting description
* A few predictions/inferences
* How confident are you? - that's statistics/data analysis

