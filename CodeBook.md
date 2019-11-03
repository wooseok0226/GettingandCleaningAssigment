#Codebook for Run_analysis.R


"Run_analysis.R" creates a tidy dataset named as "FinalData.txt" using "dplyr" packages. 

This file, "CodeBook.md" describes the each variable,

1. Loading Data

- Download
"files" <- Downloaded dataset as a zip file
"address" <- URL for the dataset

- Setting variables in features and activities
"features" <- 561 obs. of  2 variables, describing lists of all features by column name of "function"
"activities" <- 6 obs. of 2 vatiables Links the class labels with their activity name.

- Extracting from the raw data
"x_test" <- observed vector data in test group, parsed with activity features(561 columns)
"x_train" <- observed vector data in train group, parsed with activity features(561 columns)
"y_test" <- activity code for each observation in test group
"y_train" <- activity code for each observation in train group
"subject_test" <- subject number for each observation in test group
"subject_train" <- subject number for each observation in train group

2. Merging data

"X" <- binds obsered data with training-test group data by rows
"Y" <- binds activity code of training-test group data by rows
"Subject" <- binds subject number for each observed data in training-test group data by rows
"Merged_Data" <- binds observed data with codes and subject by column

3. Tidy data

"TidyData " <- Extracts only the measurements on the mean and standard deviation for each measurement from "Merged_Data".

Labeling descriptive variable names
[code column in TidyData renamed into activities
All Acc in column’s name replaced by Accelerometer
All Gyro in column’s name replaced by Gyroscope
All BodyBody in column’s name replaced by Body
All Mag in column’s name replaced by Magnitude
All start with character f in column’s name replaced by Frequency
All start with character t in column’s name replaced by Time]

4. Final data

"FinalData" <- a second, independent tidy data set with the average of each variable for each activity and each subject.
