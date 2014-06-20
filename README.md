Description of Project
=========================
The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

###Background information
One of the most exciting areas in all of data science right now is wearable computing - see for example this article ( http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:   http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  

## How to run project
Assuming the following data is in the working directory: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The script run_analysis.R can be run in R or RStudio to generate the tidy data set 'tidy_dataset.csv' described in the CodeBook.md


## Explanation of the script 'run_analysis.R'

'run_analysis.R' does the following:
* 1. Sets the working directory.
* 2. Loads 'plyr' package if it is not already instaled.
* 3. Downloads the data for the project if the data file is not already in working directory.
* 4. 
