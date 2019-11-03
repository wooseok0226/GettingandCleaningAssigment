"Run_analysis.R" creates a tidy dataset named as "FinalData.txt" using "dplyr" packages. 

This file, "CodeBook.md" describes the each variable,


"files" <- Downloaded dataset as a zip file

"address" <- URL for the dataset

"features" <- 561 obs. of  2 variables, describing lists of all features by column name of "function"

"activities" <- 6 obs. of 2 vatiables Links the class labels with their activity name.


1 subject has 128 element of vectors 

"x_

"subject_test"

"subject_train"


"X" <- binds obsered data with training-test group data by rows

"Y" <- binds activity code of training-test group data by rows

"Subject" <- binds subject number for each observed data in training-test group data by rows

"Merged_Data" <- binds observed data with codes and subject by column

"TidyData " <- Extracts only the measurements on the mean and standard deviation for each measurement from "Merged_Data".


activities
Re-naming
[code column in TidyData renamed into activities
All Acc in column’s name replaced by Accelerometer
All Gyro in column’s name replaced by Gyroscope
All BodyBody in column’s name replaced by Body
All Mag in column’s name replaced by Magnitude
All start with character f in column’s name replaced by Frequency
All start with character t in column’s name replaced by Time]

"FinalData" <- a second, independent tidy data set with the average of each variable for each activity and each subject.
