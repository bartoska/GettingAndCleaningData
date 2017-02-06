install.packages("reshape2")
library(reshape2)
library(data.table)
packages <- c("data.table", "reshape2")
sapply(packages, require, character.only = TRUE, quietly = TRUE)


path <- getwd()

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
f <- file.path(path, "Dataset.zip")
download.file(url, f)
unzip("getdata%2Fprojectfiles%2FUCI HAR Dataset.zip")



## test data:
XTest <- read.table("UCI HAR Dataset/test/X_test.txt")
YTest <- read.table("UCI HAR Dataset/test/Y_test.txt")
SubjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")

## train data:
XTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
YTrain <- read.table("UCI HAR Dataset/train/Y_train.txt")
SubjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")

## features and activity
features <- read.table("UCI HAR Dataset/features.txt")
activity <- read.table("UCI HAR Dataset/activity_labels.txt")

# part1, merging data sets
X <- rbind(XTest, XTrain)
Y <- rbind(YTest, YTrain) 
Subject <- rbind(SubjectTest, SubjectTrain)

#dimensions of new dataset
dim(X)
dim(Y)
dim(Subject)

# part2, mean & standard deviation
index <- grep("mean\\(\\)|std\\(\\)", features[,2])
length(index)
X <- X[,index] ## getting only variables with mean/stdev
dim(X) ## checking dim of subset 

# part3
Y[,1]<-activity[Y[,1],2]
head(Y)

# part4
names <- features[index,2] ## getting names for variables

names(X) <- names ## updating colNames for new dataset
names(Subject) <- "SubjectID"
names(Y) <- "Activity"

CleanedData <- cbind(Subject, Y, X)
head(CleanedData[,c(1:4)]) ## first 5 columns

#part5
CleanedData<-data.table(CleanedData)
TidyData <- CleanedData[, lapply(.SD, mean), by = 'SubjectID,Activity'] ## features average by Subject and by activity
dim(TidyData)
write.table(TidyData, file = "Tidy.txt", row.names = FALSE)










