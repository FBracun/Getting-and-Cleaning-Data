## Getting and Cleaning Data - Course Project
##


## Set working directory
setwd("./Getting and Cleaning Data/Project")

## Checks if the required "plyr" package is installed. If not, instales it.  
if(!is.element("plyr", installed.packages()[,1])){
  print("Installing packages ...")
  install.packages("plyr")
}

library(plyr)

## Set data location url and paths for file 
url <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
file <- "data.zip"


## Checks if zip file containing the data has been downloaded. If not, downloads it.
if(!file.exists(file)){
  print("downloading Data file ...")
  download.file(url,file, mode = "wb")    
}



## Reads a data from a file and if required set column names
ReadData <- function (filename,colNames = NULL){
        
        data <- data.frame()
        
        file <- unz(file, paste("UCI HAR Dataset",filename,sep="/"))
              
        if(is.null(colNames)){
                data <- read.table(file,sep="",stringsAsFactors=FALSE)
        } else {
                data <- read.table(file,sep="",col.names= colNames, stringsAsFactors=FALSE)
        }
        
        return(data)
}


## Obtaions data and merges two sets to create one data set
getmergedData <- function(type, features){
        
        subject_data <- ReadData(paste(type,"/","subject_",type,".txt",sep=""),"id")  
        y_data <- ReadData(paste(type,"/","y_",type,".txt",sep=""),"activity")
        x_data <- ReadData(paste(type,"/","X_",type,".txt",sep=""),features$V2)
        
        return (cbind(subject_data,y_data,x_data)) 
}


## Reads features used for column names for training and test data
features <- ReadData("features.txt")

##... and then read training and test data sets
train <- getmergedData("train",features) #and also set column names as defined in 'features'
test <- getmergedData("test",features) #and also set column names as defined in 'features'



## 1. Merges the training and the test sets to create one data set

data <- rbind(train, test) # merge training and test data sets
data <- arrange(data, id)  # reorder data by id


## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

dataset <- data[,c(1,2,grep("std", colnames(data)), grep("mean", colnames(data)))]


## 3. Uses descriptive activity names to name the activities in the data set

activity_labels <- ReadData("activity_labels.txt")


## 4. Appropriately labels the data set with descriptive activity names

dataset$activity <- factor(dataset$activity, labels=activity_labels$V2)


## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_dataset <- ddply(dataset, .(id, activity), .f=function(x){ 
                                                      colMeans(x[,-c(1:2)]) 
                                                      }) #id identifies each subject

## End resulty of a project

write.csv(tidy_dataset, "tidy_dataset.csv") # Save tidy data set with '.csv' for Github repo
write.csv(tidy_dataset, "tidy_dataset.txt") # Save tidy data set with '.txt' for uploading on Coursera




