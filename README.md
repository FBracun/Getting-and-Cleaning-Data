Description of Project
=========================

Getting and Cleaning Data - Course Project

The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

# How to run project
=================================

Assuming the following data is in the working environment: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The script run_analysis.R can be run in R or RStudio to generate the tidy data set 'tidy_dataset.csv' described in the CodeBook.md


## Explanation of the script 'run_analysis.R'

'run_analysis.R' does the following:
* 1. Sets the working directory.
* 2. Loads 'plyr' package if it is not already instaled.
* 3. Downloads the data for the project if the data file is not already in working directory.
* 4. 
