###
### Code to create a personal outlier distribution
###

myOutliers <- function(dataMatrix,cx=0.5,fw=5){
  nSamples <- dim(dataMatrix)[1]
  nExamples <- dim(dataMatrix)[2]
  outlierVector <- NA
  for(i in 1:dim(dataMatrix)[2]){
    jj <- jitter(rep(1,nSamples))
    plot(jj,dataMatrix[,i],type="n",xlim=c(0.5,1.5),xaxt="n")
    text(jj,dataMatrix[,i],labels=1:nSamples,cex=cx)
    outliers <- readline(prompt=("Enter outlier numbers separted by spaces"))
    outliers <- as.numeric(unlist(strsplit(outliers," ")))
    tmpInd <- rep(FALSE,dim(dataMatrix)[1])
    tmpInd[outliers] <- TRUE
    outlierVector <- c(outlierVector,tmpInd)
  }
  outlierVector <- outlierVector[-1]
  dataValues <- as.vector(dataMatrix)

  dataLess <- dataValues[dataValues <= median(dataValues)]
  outlierLess <- outlierVector[dataValues <= median(dataValues)]
  dataMore <- dataValues[dataValues > median(dataValues)]
  outlierMore <- outlierVector[dataValues > median(dataValues)]

  outLessOrd <- outlierLess[order(dataLess)]
  outMoreOrd <- outlierMore[order(dataMore)]

  dataMoreOrd <- dataMore[order(dataMore)]
  dataLessOrd <- dataLess[order(dataLess)]
                         
  probMoreOut <- myfilter(rev(cumsum(rev(outMoreOrd))/(1:length(outMoreOrd))),rep(1/fw,fw))
  probLessOut <- myfilter(cumsum(outLessOrd)/(1:length(outLessOrd)),rep(1/fw,fw))

  ssMore <- smooth.spline(probMoreOut ~ dataMoreOrd)
  ssLess <- smooth.spline(probLessOut ~ dataLessOrd)
  
  outlierFunction <- function(x){
   probOut <- rep(NA,length(x))
   probOut[x > median(dataValues)] <- pmax(pmin(predict(ssMore,x[x > median(dataValues)])$y,1),0)
   
   probOut[x <= median(dataValues)] <-pmax(pmin(predict(ssLess,x[x <= median(dataValues)])$y,1),0)
   return(probOut)
  }
  
  return(list(outliers = outlierVector, data = dataValues,outlierFunction=outlierFunction))
 
}

## Rafa's myfilter function

myfilter <- function(x,filter,...){
  L=length(x)
  if(L>length(filter)){
    res=filter(x,filter,...)
    ##now fill out the NAs
    M=length(filter)
    N=(M- 1)/2
    for(i in 1:N){
      w=filter[(N-i+2):M]
      y=x[1:(M-N+i-1)]
      res[i] = sum(w*y)/sum(w)
      
      w=rev(w)
      ii=(L-(i-1))
      y=x[(ii-N):L]
      res[ii]<-sum(w*y)/sum(w)
    }
  } else{ res=rep(mean(x),L)}
  return(res)
}
