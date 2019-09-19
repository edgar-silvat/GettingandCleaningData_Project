
Dataset Processing Information
==============================

Datasets below are processed to perform a series of operations in R with the function run_analysis(). In general what this function do is:
- Load info from .txt files dataset
- Merge the datasets into one in a tidy form
- Get 2 tidy data tables: 
	1. SmartphoneData: with selected variables that contains mean and standard deviation 
	2. SummarySmartphoneData: with calculated averages for each selected varible (from SmartphoneData) for each subject and activity combination.
- At the end of the function the tables are just display in the console and the 2 tables are exported to a .txt file for each

Requirements
============
- Software: RStudio (to run the function "run_analysis.R" file)
- Libraries installed on R: dplyr and reshape2

Steps to run the run_analysis function:
=======================================
1. Download the .txt files below (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and place it in a folder name "data":
- 'data/features_info.txt': Shows information about the variables used on the feature vector.

- 'data/features.txt': List of all features.

- 'data/activity_labels.txt': Links the class labels with their activity name.

- 'data/X_train.txt': Training set.

- 'data/y_train.txt': Training labels.

- 'data/X_test.txt': Test set.

- 'data/y_test.txt': Test labels.

- 'data/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'data/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

2. Open R Studio and ser your working directory in the same folder where you put the "data" folder with all the files.
3. Fork the run_analysis.R to your computer or open a new R Script, copy the run_analysis.R code, paste it and save it in your working directory as run_analysis.R.
4. Press Source button or type source in the console ('*Your working directory*/run_analysis.R')
5. Type in the console: run_analysis() 
6. The tables (discribe in the Code Book section) will appear in the Source RStudio window 

Initial Dataset Information
============================

Human Activity Recognition Using Smartphones Dataset Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% 
the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration 
signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, 
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'data/features_info.txt': Shows information about the variables used on the feature vector.

- 'data/features.txt': List of all features.

- 'data/activity_labels.txt': Links the class labels with their activity name.

- 'data/X_train.txt': Training set.

- 'data/y_train.txt': Training labels.

- 'data/X_test.txt': Test set.

- 'data/y_test.txt': Test labels.

- 'data/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'data/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

==========
CODE BOOK
==========

Initial Dataset Information
============================
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at 
a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration 
signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional 
signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
(Note the 'f' to indicate frequency domain signals). 

This information appears on table "SmartphonesData" (Step 4)
==================================================
subject: individual number who perform the activity (30 in total)
activity: activity that perform the person (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
angle(): Angle between to vectors. 

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

This information applies appears on table "SummarySmartphonesData" (Step 5)
===========================================================================

subject: individual number who perform the activity (30 in total)
activity: activity that perform the person (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
rest of the variables: same variables as in the table "SmartphonesData" but in Average (mean) for each subject and activity combination


Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws
For more information about the processing of this dataset contact: edgar.silvat@gmail.com

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International 
Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
