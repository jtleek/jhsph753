Implementing the code for Baltimore
========================================================

Jaiwei's code

```r
library(XML)
htmlRaven = htmlTreeParse("http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens", 
    useInternalNodes = TRUE)

## Choose the list items with class='score' ##
Score = xpathSApply(htmlRaven, "//li[@class='score']", xmlValue)

## Choose the list items with class='team-name' ##
TeamName = xpathSApply(htmlRaven, "//li[@class='team-name']", xmlValue)

## Choose the whole unordered list with class='score' ##
WinLoss = xpathSApply(htmlRaven, "//ul[@class='game-schedule']//span", xmlValue)

## This is tricky ## First get all the //td items under the rows(//tr)
## whose @class contains 'row' ## Choose those which contains ',', which
## are the actual dates ## There is no class or id under the date
## component. I had to do this. ##
Date = grep(",", xpathSApply(htmlRaven, "//tr[contains(@class,'row')]//td", 
    xmlValue), value = TRUE)

## Combine the data ##
RavenData = data.frame(date = Date, team = TeamName, status = WinLoss, score = Score)

## Hack the scores a bit
firstScore <- as.numeric(sapply(as.character(RavenData$score), function(x) {
    strsplit(x, "-")[[1]][1]
}))
secondScore <- sapply(as.character(RavenData$score), function(x) {
    strsplit(x, "-")[[1]][2]
})
secondScore <- sapply(secondScore, function(x) {
    strsplit(x, " ")[[1]][1]
})
ravenScore <- as.numeric(ifelse(RavenData$status == "W", firstScore, secondScore))
opponentScore <- as.numeric(ifelse(RavenData$status == "L", firstScore, secondScore))
```


Create the design matrix - fit the model


```r
X <- model.matrix(~RavenData$status == "W")
y <- ravenScore
betaHat <- solve(t(X) %*% X) %*% t(X) %*% y
betaHat
```

```
##                              [,1]
## (Intercept)                 19.67
## RavenData$status == "W"TRUE  9.19
```

```r
lm1 <- lm(ravenScore ~ RavenData$status == "W")
lm1$coeff
```

```
##                 (Intercept) RavenData$status == "W"TRUE 
##                       19.67                        9.19
```


Calculate the sandwich


```r
library(sandwich)
```

```
## Loading required package: zoo
```

```
## Attaching package: 'zoo'
```

```
## The following object(s) are masked from 'package:base':
## 
## as.Date, as.Date.numeric
```

```r
D <- (y - X %*% betaHat) %*% t(y - X %*% betaHat)
sHat0 <- solve(t(X) %*% X) %*% t(X) %*% D %*% X %*% solve(t(X) %*% X)
sHat0
```

```
##                             (Intercept) RavenData$status == "W"TRUE
## (Intercept)                  -9.252e-18                   2.392e-16
## RavenData$status == "W"TRUE  -5.089e-17                   1.086e-15
```

```r

D <- diag(as.vector((y - X %*% betaHat)^2))
sHat <- solve(t(X) %*% X) %*% t(X) %*% D %*% X %*% solve(t(X) %*% X)
sHat
```

```
##                             (Intercept) RavenData$status == "W"TRUE
## (Intercept)                        3.87                       -3.87
## RavenData$status == "W"TRUE       -3.87                       13.74
```

```r
vcovHC(lm1, type = "HC0")
```

```
##                             (Intercept) RavenData$status == "W"TRUE
## (Intercept)                        3.87                       -3.87
## RavenData$status == "W"TRUE       -3.87                       13.74
```



