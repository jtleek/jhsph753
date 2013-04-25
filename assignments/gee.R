## Generate scenario
## Design II
## AR-1
## alpha = 0.5

library(MASS)
vMat <- function(x,alpha){
  nObs <- length(x)
  vMat <- matrix(NA,nrow=nObs,ncol=nObs)
  for(i in 1:nObs){
    vMat[i,] <- alpha^abs((x-x[i])/2)
  } 
  return(vMat)
}

xBasis <- matrix(c(8,10,12,8,10,14,8,12,14,10,12,14),byrow=T,nrow=4)
xValues <- xBasis[rep(c(1:4),each=2),]

B <- 100
cov1 <- cov2 <- rep(NA,B)
  
for(b in 1:B){
  yValues <- xValues*0
  beta1 <- 0.6
  for(i in 1:8){
    yValues[i,] <- mvrnorm(1,mu=beta1*xValues[i,],Sigma=vMat(xValues[1,],0.5))
  }

  yValuesV <- as.vector(t(yValues))
  xValuesV <- as.vector(t(xValues))
  groupId <- rep(1:8,each=3)
  gee1 <- gee(yValuesV ~ xValuesV,id=groupId,corstr="independence")

  est <- gee1$coefficients[2]
  sErr <- diag(sqrt(gee1$robust.variance))[2]
  cov1[b] <- (est + 1.96*sErr > 0.6) & (est - 1.96*sErr < 0.6)
}
