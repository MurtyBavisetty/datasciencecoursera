# Getting and Cleaning Data Project 1
# This R script file contains the steps to combine the test and training data
# Our goal is to combine the data from various files and make it into tidy data
# The following are the details of the steps as required by the project descrption
#
# 1. Merges the training and test sets to create one data set
#
# Have done some exploratory analysis on how many rows and columns in each of the files
# to get a better understanding of the problem
# First thing that was noticed was that there are no column headers in the data files
#
# Add the column headers (lower case) for the subject_train.txt and subject_test.txt files
#
library(dplyr)
#
#
subjectTrain <- read.table("train/subject_train.txt", col.names=c("subject"))  
subjectTest <- read.table("test/subject_test.txt", col.names=c("subject"))
#
# combine the data sets above into one data set
#
subjects <- rbind(subjectTrain, subjectTest)
#
# In a similar way, the feature measurements in test and train folders can be read and combined
# as follows. 
# Note: X_train.txt contains only the feature data measurements for all 561 features
#
featuresTrainData <- read.table("train/X_train.txt")
featuresTestData <- read.table("test/X_test.txt")
featureData <- rbind(featuresTrainData, featuresTestData)
#
# Now assign the column names to the featuresData table using the features.txt
#
featureLabels <- read.table("features.txt", col.names = c("index", "features"))
#
colLabels <- featureLabels$features 
colnames(featureData) <- colLabels
# 
# This finishes the preliminary grouping of the test and train data
#
# 2. Extracts only the measurements on the mean and standard deviation for each measurement
#
# Now we need to subset the data columns containing mean() and std() 
subsetFeatureLabels <- as.character(featureLabels$features[grepl('mean()|std()', featureLabels$features)])
# Notice that there are MeanFreq() features also present in this subset and we need to
# exclude those as well
# 
subsetFeatureLabels <- as.character(subsetfeatureLabels[!grepl('meanFreq()', subsetFeatureLabels)])
# So now we need to select these labeled columns from features data set
#
subsetFeatureData <- featureData[, c(subsetFeatureLabels)]
#
# 3. Uses descriptive activity names to name the activities in the data sets (both train and test)
#
activityTrain <- read.table("train/y_train.txt", col.names=c("activity"))
activityTest <- read.table("test/y_test.txt", col.names=c("activity"))
#
# Note we combine the activities in the same order as train and test only
#
activities<- rbind(activityTrain, activityTest)
#
# Assign the activity labels as per the info in the activity_labels.txt
#
# convert the Activity column to character type as we assign the character string to this
#
activities$activity = as.character(activities$activity)
#
activities$activity[activities$activity == "1"] <- "WALKING"
activities$activity[activities$activity == "2"] <- "WALKING_UPSTAIRS"
activities$activity[activities$activity == "3"] <- "WALKING_DOWNSTAIRS"
activities$activity[activities$activity == "4"] <- "SITTING"
activities$activity[activities$activity == "5"] <- "STANDING"
activities$activity[activities$activity == "6"] <- "LAYING"
#
# 4. Appropriately labels the data set with descriptive variable names (i.e. data set in step 3)
# Use gsub function to rename the column labels by making meaningful names and remove parenthesis
# 
names(subsetFeatureData) <- gsub("Acc", "Acceleration", names(subsetFeatureData))
names(subsetFeatureData) <- gsub("Mag", "Magnitude", names(subsetFeatureData))                                
names(subsetFeatureData) <- gsub("-mean", "Mean", names(subsetFeatureData))  
names(subsetFeatureData) <- gsub("-std", "StandardDeviation", names(subsetFeatureData))
# remove the parenthesis as follows
names(subsetFeatureData) <- gsub("\\(|\\)", "", names(subsetFeatureData))
# 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.
#
tidyFeatureDataSet <- cbind(subjects, activities, subsetFeatureData)
#
#?ddp
# 5B. save the data set in step 5 into a text file to be uploaded
#
write.table(tidyFeatureDataSet, file="tidydata.txt", row.name=FALSE)

# 
#http://git-scm.com/book/en/v2/Git-Basics-Getting-a-Git-Repository#_git_basics_chapter
#http://git-scm.com/book/en/v2/Git-Basics-Working-with-Remotes
#
