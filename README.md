# GettingandCleaningAssigment
 
==============================================================================

This repository includes "Run_analysis.R" script file which creates tidy dataset from
 "Human Activity Recognition Using Smartphones Dataset Version 1.0".
 
Above data contains results of experiments to describe human activity recognition of the smartphone

"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

The experiments have been carried out with a group of 30 volunteers. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone on the waist. 

And the data recorded as below.

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
 
===============================================================================

"Run_analysis.R" creates a tidy dataset named as "FinalData.txt" using "dplyr" packages.
"CodeBook.md" a code book that describes the variables, 


FinalData.txt is a second, independent data set with the average of each variable for each activity and each subject.
This has a format of a tibble: 180 x 88, and as follows


[...
  subject activity TimeBodyAcceler… TimeBodyAcceler… TimeBodyAcceler… TimeGravityAcce…
     <int> <fct>               <dbl>            <dbl>            <dbl>            <dbl>
 1       1 LAYING              0.222         -0.0405           -0.113            -0.249
 2       1 SITTING             0.261         -0.00131          -0.105             0.832
 3       1 STANDING            0.279         -0.0161           -0.111             0.943
 4       1 WALKING             0.277         -0.0174           -0.111             0.935
 5       1 WALKING…            0.289         -0.00992          -0.108             0.932
...]

