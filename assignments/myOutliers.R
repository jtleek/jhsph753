###
### Code to create a personal outlier distribution
###

myOutliers <- function(dataMatrix,cx=0.5){
  nSamples <- dim(dataMatrix)[1]
  nExamples <- dim(dataMatrix)[2]
  outlierValues <- NA
  for(i in 1:dim(dataMatrix)[2]){
    jj <- jitter(rep(1,nSamples))
    plot(jj,dataMatrix[,i],type="n",xlim=c(0.5,1.5),xaxt="n")
    text(jj,dataMatrix[,i],labels=1:nSamples,cex=cx)
    outliers <- readline(prompt=("Enter outlier numbers separted by spaces"))
    outliers <- as.numeric(unlist(strsplit(outliers," ")))
    outlierValues <- c(outlierValues,dataMatrix[outliers,i])
  }
  outlierValues <- outlierValues[-1]

  outlierFunction <- function(x){
    med <- median(dataMatrix)
    
  }
  
  
}
