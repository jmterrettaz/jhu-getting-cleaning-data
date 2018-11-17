

#Human Activity Recognition Using Smartphones

## Source data

The Human Activity Recognition database http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones is built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were collected at a constant rate of 50Hz. The data collected were then submitted to several processing steps which produced 561 measurement variables (see `data/README.txt` for a description of the processing steps and `data/features_info.txt` for a description of the measutements).

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The source data is available in directory `data`.

## Analysis

Using the source data, we developed a R script which:
- merges the train and test datasets
- extracts for each measurement only the mean and standard deviation variables
- groups the resulting data by subject and activity
- and calculates the average of each variable for each groups

The computation is implemented in R script `run_analysis.R`.

The resulting data is file `result.txt`.

The resulting table contains the following variables:

mean(): Mean value
std(): Standard deviation

for the following signals:

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
fBodyGyroMag
fBodyGyroJerkMag

(see `data/features_info.txt` for a detailed description of the variables).
