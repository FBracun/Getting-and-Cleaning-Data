Description of Project
=========================
The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

###Background information
One of the most exciting areas in all of data science right now is wearable computing - see for example this article (http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones .

###What does the 'run_analysis.R' script do?
R script called run_analysis.R that does the following.  Merges the training and the test sets to create one data set. Extracts only the measurements on the mean and standard deviation for each measurement.  Uses descriptive activity names to name the activities in the data set Appropriately labels the data set with descriptive activity names.  Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


## How to run project
Assuming the following data is in the working directory: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The script run_analysis.R can be run in R or RStudio to generate the tidy data set 'tidy_dataset.csv' described in the CodeBook.md


## Explanation of the script 'run_analysis.R'

'run_analysis.R' does the following:

First, make a few tasks to prepare the working environment: 
* Sets the working directory.
* Loads 'plyr' package if it is not already instaled.
* Downloads the data for the project if the data file is not already in the working directory.

Then the code defines two functions that are called by later commands:
* ReadData(filename, colNames) function which reads data from 'filename' in zipped file 'data.zip' and if colNames is specified sets column names  
* getmergedData(type, features) function obtains data - by calling function ReadData() - and merges two data sets to create one data set

The main code starts in line 58. In line 58 the code first reads features used for column names for training and test data and then in lines 61 and 62 it reads training and test data sets.

At this point the code has prepared all that we need to prepare tidy data, the goal of this project. This is carried out in five stages. 

Stage 1. Merges the training and the test sets to create one data set
* training and test data sets obtained in lines 61 and 62 are merged by code in line 68
* merged dataset is then reordered by id

Stage 2. Extracts only the measurements on the mean and standard deviation for each measurement.
* in line 74 data columns are filtered and stored in dataframe 'dataset' 
* first by using two calls of grep function with "std" and "mean" parameters, we have obtained two vectors indicating columns with the measurements on the standard and  mean deviation for each measurement, respectively
* then we use c() function to construct filtering vector 'c(1,2,grep("std", colnames(data)), grep("mean", colnames(data)))' to subset columns from data. Note that columns 1 (i.e., 'id') and 2 (i.e., 'activity') are also included in dataset.

Stage 3. Uses descriptive activity names to name the activities in the data set
* in line 79 activity labels are obtained from "activity_labels.txt" file using ReadData() function defined at the begging of script. 

Stage 4. Appropriately labels the data set with descriptive activity names
* in line 84 activity factor in dataset is renamed with descriptive activity names

Stage 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* in this stage columns are averaged grouping by activity and subject. Note that 'id' is subject's identifier.
* in line 89 code creates a tidy data set from datase by using ddply() function. For each subset of a data frame 'dataset', function ddply() applies function 'f=function(x){ colMeans(x[,-c(1:2)]) })' and then combine results into a data frame 'tidy_dataset. The '.(activity, id)' defines variables to split 'dataset' data frame by, i.e. the variables used by ddply() function to summarize a dataset. Note the use of the '.' function to allow id and activity to be used without quoting.

In lines from 101 to 103 a tidy data set and it's column names are written to files.

