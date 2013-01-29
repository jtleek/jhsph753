---
title       : Randomness and parameters 
subtitle    : 
author      : Jeffrey Leek, Assistant Professor of Biostatistics 
job         : Johns Hopkins Bloomberg School of Public Health
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : zenburn   # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
---





## What is Randomness?

You may be used to thinking of the stochastic parts of random 
variables as ‘just chance’. In very select situations this is fine; 
radioactive decay really does appear to be ‘just chance’ (but ask Caffo about this...)

However, this is not what ‘random variables’ actually represent 
in most applications, and it can be a misleading simpliﬁcation to 
think that it’s ‘just chance’ that prevents us knowing the truth. 


---

## What is Randomness?


<img class=center src=assets/img/ohm.png height='50%'/>


Recall high school physics. For two resistors ``in series'', the resistances are added to give a total (Y , measured in Ohms, $\Omega$) which we record without error. We know the number of gold (X) and silver stripes (Z). We also know that each resistance is $\propto$ number of stripes.
__Q__: How much resistance do stripes of each color correspond to? 



---

## What is Randomness?

Thought experiment 1:  Note that in this situation there is no measurement error or noise, and nothing random is going on. What is the value of each gold stripe?

<img class=center src=assets/img/ohmplot1.png height='50%'/>

---

## What is randomness?

What is the difference between X and X+1? 

<img class=center src=assets/img/ohmplot2.png height='50%'/>

---

## What is randomness?

What is the difference between X and X+1? 


<img class=center src=assets/img/ohmplot3.png height='50%'/>

---


## Thought Experiment Math

Here's the truth; 

$$ Y_{n\times1} =\gamma_0 1_{n\times1} + \gamma_1 X_{n\times1} + \gamma_2 Z_{n\times1}$$

where $n$ is evenly distributed between all $X,Z$ combinations.
