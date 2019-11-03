# Peer-graded Assignment: Getting and Cleaning Data Course Project
# 2019/11/03

#1-1.Prepare dplyr package

intall.packages("dplyr")
library(dplyr)

#1-2.Download Data from Web

files <- "Assignment.zip"
if (!file.exists(files)){
    address <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(address, files, method="curl")
}

#1-3.Unzip Data
# Checking if folder exists
if (!file.exists("UCI HAR Dataset")) { 
    unzip(files) 
}

#1-4.Load txt to dataframe

#'features.txt': List of all features.
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
# 561 obs. of  2 variables

#'activity_labels.txt': Links the class labels with their activity name.
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
# 6 obs. of  2 variables

#x_test/training -> data, y_test/training -> activity code
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
#row = 2947
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
#row = 7352
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

###############################################################################

#2-1  Merges the training and the test sets to create one data set.
#bind obsered data with training-test values by rows(x,y,subject)
#binding observed data with with codes and subject by column

X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)
str(Merged_Data)
#10299 obs. of  563 variables:

#2-2 Extracts only the measurements on the mean and standard deviation for each measurement.

TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))

#2-3 Uses descriptive activity names to name the activities in the data set
#Newly define "code" variable as names of activity
TidyData$code <- activities[TidyData$code, 2]


#2-4 Appropriately labels the data set with descriptive variable names

names(TidyData)[2] = "activity"
names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
names(TidyData)<-gsub("^t", "Time", names(TidyData))
names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData)<-gsub("angle", "Angle", names(TidyData))
names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))

#2-5 From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.

FinalData <- TidyData %>%
    group_by(subject, activity) %>%
    summarise_all(funs(mean))
write.table(FinalData, "FinalData.txt", row.name=FALSE)

str(FinalData)
FinalData
