###Raw Data Collection

The following partial description was taken from features.txt that accompanied the data set:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 

Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. (these files exist for train and test data sets and do not have header column)
- Its activity label. (This is provided in a separate file)
- An identifier of the subject who carried out the experiment. (it is in a separate file)
- Several other features are captured in the data sets - too many to explain each of them here.

tBodyAcc-XYZ  - Body acceleration components in X, Y and Z directions respectively
tGravityAcc-XYZ - Acceleration due to gravity components in X, Y and Z directions
tBodyAccJerk-XYZ - Body Jerk(rate of acceleration) in X, Y, and Z directions
tBodyGyro-XYZ - Body Gyroscopic angular velocity in X, Y, and Z directions
tBodyGyroJerk-XYZ - Body Gyroscopic Jerk in X, Y, and Z direction
:
:
:

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

- Only mean and avg value columns are captured for this project.

- 1. Merges the training and test sets to create one data set

 - Have done some exploratory analysis on how many rows and columns in each of the files
 - to get a better understanding of the problem
 - First thing that was noticed was that there are no column headers in the data files

 - Add the column headers (lower case) for the subject_train.txt and subject_test.txt files
 - combine the data sets above into one data set

 - In a similar way, the feature measurements in test and train folders can be read and combined as follows. 
 - Note: X_train.txt contains only the feature data measurements for all 561 features

 - Now assign the column names to the featuresData table using the features.txt
 - This finishes the preliminary grouping of the test and train data

- 2. Extracts only the measurements on the mean and standard deviation for each measurement

 - Now we need to subset the data columns containing mean() and std() 0

 - Notice that there are MeanFreq() features also present in this subset and we need to
 - exclude those as well
 -
 - So now we need to select these labeled columns from features data set

- 3. Uses descriptive activity names to name the activities in the data sets (both train and test)
 - Note we combine the activities in the same order as train and test only
 - Assign the activity labels as per the info in the activity_labels.txt

 - convert the Activity column to character type as we assign the character string to this

- 4. Appropriately labels the data set with descriptive variable names (i.e. data set in step 3)
 - Use gsub function to rename the column labels by making meaningful names and remove parenthesis

 - 5A. From the data set in step 4, creates a second, independent tidy data set with the average 
 -  of each variable for each activity and each subject. This is done using functions from dplyr package
 -  using chaining feature to summarize the data in each column.

 - 5B. save the data set in step 5 into a text file to be uploaded
 -
