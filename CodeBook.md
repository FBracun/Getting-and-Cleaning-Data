Description of Tidy Dataset
=========================
A "tidy_dataset.csv" contains 180 observations of 81 variables. For each record it is provided:
* A 79-feature vector with time or frequency domain variables. Features are the average values of the raw features grouped by "Activity" and "Subject".
* Its activity label. 
* An identifier of the subject who carried out the experiment.

#Raw Data
A full description of raw data can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.


#Transformations on raw data
Transformations on raw data are performed in five stages: 

Stage 1. Merges the training and the test sets to create one data set
* training and test data sets are merged 
* merged dataset is then reordered by id

Stage 2. Extracts only the measurements on the mean and standard deviation for each measurement.
* merged dataset columns are then filtered, i.e. only  the measurements on the mean and standard deviation for each measurement are extracted


Stage 3. Uses descriptive activity names to name the activities in the data set
* activity labels are obtained from "activity_labels.txt" file 

Stage 4. Appropriately labels the data set with descriptive activity names
* activity factor in dataset is renamed with descriptive activity names

Stage 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* columns are averaged grouping by activity and subject.

# Tidy Data Set Features
In our data set only the mean value and standard deviation from signals described above are extracted. Raw data transformation produces a tidy data set that includes both the training and 
test data sets. Feature names with the format "mean(tABC...)" are the average values of the features "tABC..." grouped by "Activity" and "Subject". That means that the features in tidy-dataset.csv are average values of mean value and standard deviation of signals grouped by activity and subject. The tidy data set contains the following features:

 [1] "Activity" ##  Activity label. See description of activity levels belove.                         
 [2] "Subject"  ##  An identifier of the subject who carried out the experiment.                             
 [3] "mean(tBodyAcc.std...X)"               
 [4] "mean(tBodyAcc.std...Y)"               
 [5] "mean(tBodyAcc.std...Z)"               
 [6] "mean(tGravityAcc.std...X)"            
 [7] "mean(tGravityAcc.std...Y)"            
 [8] "mean(tGravityAcc.std...Z)"            
 [9] "mean(tBodyAccJerk.std...X)"           
[10] "mean(tBodyAccJerk.std...Y)"           
[11] "mean(tBodyAccJerk.std...Z)"           
[12] "mean(tBodyGyro.std...X)"              
[13] "mean(tBodyGyro.std...Y)"              
[14] "mean(tBodyGyro.std...Z)"              
[15] "mean(tBodyGyroJerk.std...X)"          
[16] "mean(tBodyGyroJerk.std...Y)"          
[17] "mean(tBodyGyroJerk.std...Z)"          
[18] "mean(tBodyAccMag.std..)"              
[19] "mean(tGravityAccMag.std..)"           
[20] "mean(tBodyAccJerkMag.std..)"          
[21] "mean(tBodyGyroMag.std..)"             
[22] "mean(tBodyGyroJerkMag.std..)"         
[23] "mean(fBodyAcc.std...X)"               
[24] "mean(fBodyAcc.std...Y)"               
[25] "mean(fBodyAcc.std...Z)"               
[26] "mean(fBodyAccJerk.std...X)"           
[27] "mean(fBodyAccJerk.std...Y)"           
[28] "mean(fBodyAccJerk.std...Z)"           
[29] "mean(fBodyGyro.std...X)"              
[30] "mean(fBodyGyro.std...Y)"              
[31] "mean(fBodyGyro.std...Z)"              
[32] "mean(fBodyAccMag.std..)"              
[33] "mean(fBodyBodyAccJerkMag.std..)"      
[34] "mean(fBodyBodyGyroMag.std..)"         
[35] "mean(fBodyBodyGyroJerkMag.std..)"     
[36] "mean(tBodyAcc.mean...X)"              
[37] "mean(tBodyAcc.mean...Y)"              
[38] "mean(tBodyAcc.mean...Z)"              
[39] "mean(tGravityAcc.mean...X)"           
[40] "mean(tGravityAcc.mean...Y)"           
[41] "mean(tGravityAcc.mean...Z)"           
[42] "mean(tBodyAccJerk.mean...X)"          
[43] "mean(tBodyAccJerk.mean...Y)"          
[44] "mean(tBodyAccJerk.mean...Z)"          
[45] "mean(tBodyGyro.mean...X)"             
[46] "mean(tBodyGyro.mean...Y)"             
[47] "mean(tBodyGyro.mean...Z)"             
[48] "mean(tBodyGyroJerk.mean...X)"         
[49] "mean(tBodyGyroJerk.mean...Y)"         
[50] "mean(tBodyGyroJerk.mean...Z)"         
[51] "mean(tBodyAccMag.mean..)"             
[52] "mean(tGravityAccMag.mean..)"          
[53] "mean(tBodyAccJerkMag.mean..)"         
[54] "mean(tBodyGyroMag.mean..)"            
[55] "mean(tBodyGyroJerkMag.mean..)"        
[56] "mean(fBodyAcc.mean...X)"              
[57] "mean(fBodyAcc.mean...Y)"              
[58] "mean(fBodyAcc.mean...Z)"              
[59] "mean(fBodyAcc.meanFreq...X)"          
[60] "mean(fBodyAcc.meanFreq...Y)"          
[61] "mean(fBodyAcc.meanFreq...Z)"          
[62] "mean(fBodyAccJerk.mean...X)"          
[63] "mean(fBodyAccJerk.mean...Y)"          
[64] "mean(fBodyAccJerk.mean...Z)"          
[65] "mean(fBodyAccJerk.meanFreq...X)"      
[66] "mean(fBodyAccJerk.meanFreq...Y)"      
[67] "mean(fBodyAccJerk.meanFreq...Z)"      
[68] "mean(fBodyGyro.mean...X)"             
[69] "mean(fBodyGyro.mean...Y)"             
[70] "mean(fBodyGyro.mean...Z)"             
[71] "mean(fBodyGyro.meanFreq...X)"         
[72] "mean(fBodyGyro.meanFreq...Y)"         
[73] "mean(fBodyGyro.meanFreq...Z)"         
[74] "mean(fBodyAccMag.mean..)"             
[75] "mean(fBodyAccMag.meanFreq..)"         
[76] "mean(fBodyBodyAccJerkMag.mean..)"     
[77] "mean(fBodyBodyAccJerkMag.meanFreq..)" 
[78] "mean(fBodyBodyGyroMag.mean..)"        
[79] "mean(fBodyBodyGyroMag.meanFreq..)"    
[80] "mean(fBodyBodyGyroJerkMag.mean..)"    
[81] "mean(fBodyBodyGyroJerkMag.meanFreq..)"


"Activity" levels:
* 1 WALKING
* 2 WALKING_UPSTAIRS
* 3 WALKING_DOWNSTAIRS
* 4 SITTING
* 5 STANDING
* 6 LAYING


Prefixes in "mean(tABC...)" and "mean(fABC...)":
* t - prefix 't' to denote time domain signals
* f - prefix 'f' to denote frequency domain signals
