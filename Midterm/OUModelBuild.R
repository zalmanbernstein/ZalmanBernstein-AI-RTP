####################################
# Read in data
####################################
myPath <- "/Users/jamessiderius/OUDataClean.csv"
myData <- read.csv(myPath)
myData <- read.csv('~/Dropbox (MIT)/MIT/Tuck-Teaching/RTP/midterm/10.1287.ited.2021.0251ca/OUCaseMaterials/OUDataClean.csv')
#fix incorrect data types
myData$DRG01 <- as.factor(myData$DRG01)
myData$Flipped <- as.factor(myData$Flipped)
###############################################################
# Use a decision tree to determine factors that impact Flipped
###############################################################
#check and install required libraries if necessary
if (!require("caret")) {
  install.packages("caret")
  library("caret")
}
if (!require("rpart")) {
  install.packages("rpart")
  library("rpart")
}
if (!require("rpart.plot")) {
  install.packages("rpart.plot")
  library("rpart.plot")
}
if (!require("dplyr")) {
  install.packages("dplyr")
  library("dplyr")
}
if (!require("ggplot2")) {
  install.packages("ggplot2")
  library("ggplot2")
}


# Subpart (xxvii)
trainSetSize <- floor(0.6 * nrow(myData))
RNGkind(sample.kind = "Rejection")
set.seed(12345)
trainInd <- sample(seq_len(nrow(myData)), size = trainSetSize)
trainSet <- myData[trainInd, ]
testSet <- myData[-trainInd, ]

# Subpart (xxviii): Run a logistic (logit) regression

# Subpart (xxix): Create the classification tree

# Subpart (xxx): Prune the tree

# Subpart (xxxi): Create the confusion matrix

### Is this a good model? How might we change it?
