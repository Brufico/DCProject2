---
title: "Code Book for the final tidy dataset (summary.txt)"
author: "BFC"
output: html_document
---

## Structure
* 180 observations x 68 variables
* each row presents the mean of 66 variables, computed for a specific subject/activity combination
* The first two variables identify the  subject_id/activity combination for which the measurement mean has been computed
* The other 66 variables are the mean of a specific measurement.

## Units

The units have been eliminated in the collection process, for two reasons :

1. acceleration has non-SI "standard gravity units 'g'" (cf README.txt, line 49) . Therefore the units for each measurement should be:
 + acceleration ( "Acc" measurement) is in 'g'
 + acceleration Jerk ("AccJerk" measurement), being the time-derivative of the acceleration (cf feature_info.txt), has dimension g.s-1 
  + angular velocity ("Gyro" measurement) is in radians.s-1 (cf feature_info.txt, line 53)
 + angular velocity Jerk ("AccJerk" measurement) is in radians.s-2


2. **BUT** all these measurements are "are *normalized and bounded within [-1,1]*" (cf feature_info.txt, line 57). Consequently:
 + each measurement is a dimensionless number between -1 and 1
 + each measurement mean or standard deviation (and the mean of these as well) has the same dimension: **it is a dimensionless number between -1 and 1**



## Variables

 # - name    |	nature
-------------- | -------------
1 - subject_id  | id of the test subject (numeric, 1 to 30)
2 - activity  | name of the activity 	(Factor, 6 levels)
**3 to 68- measurement**  | mean of the given measurement, for each combination subject_id/activity (numeric, dimensionless)
3 - tBodyAcc-mean-X  | (numeric, dimensionless)
4 - tBodyAcc-mean-Y  | (numeric, dimensionless)
5 - tBodyAcc-mean-Z  | (numeric, dimensionless)
 6 - tBodyAcc-std-X  | (numeric, dimensionless)
 7 - tBodyAcc-std-Y  | (numeric, dimensionless)
 8 - tBodyAcc-std-Z  | (numeric, dimensionless)
 9 - tGravityAcc-mean-X  | (numeric, dimensionless)
 10 - tGravityAcc-mean-Y  | (numeric, dimensionless)
 11 - tGravityAcc-mean-Z  | (numeric, dimensionless)
 12 - tGravityAcc-std-X  | (numeric, dimensionless)
 13 - tGravityAcc-std-Y  | (numeric, dimensionless)
 14 - tGravityAcc-std-Z  | (numeric, dimensionless)
 15 - tBodyAccJerk-mean-X  | (numeric, dimensionless)
 16 - tBodyAccJerk-mean-Y  | (numeric, dimensionless)
 17 - tBodyAccJerk-mean-Z  | (numeric, dimensionless)
 18 - tBodyAccJerk-std-X  | (numeric, dimensionless)
 19 - tBodyAccJerk-std-Y  | (numeric, dimensionless)
 20 - tBodyAccJerk-std-Z  | (numeric, dimensionless)
 21 - tBodyGyro-mean-X  | (numeric, dimensionless)
 22 - tBodyGyro-mean-Y  | (numeric, dimensionless)
 23 - tBodyGyro-mean-Z  | (numeric, dimensionless)
 24 - tBodyGyro-std-X  | (numeric, dimensionless)
 25 - tBodyGyro-std-Y  | (numeric, dimensionless)
 26 - tBodyGyro-std-Z  | (numeric, dimensionless)
 27 - tBodyGyroJerk-mean-X  | (numeric, dimensionless)
 28 - tBodyGyroJerk-mean-Y  | (numeric, dimensionless)
 29 - tBodyGyroJerk-mean-Z  | (numeric, dimensionless)
 30 - tBodyGyroJerk-std-X  | (numeric, dimensionless)
 31 - tBodyGyroJerk-std-Y  | (numeric, dimensionless)
 32 - tBodyGyroJerk-std-Z  | (numeric, dimensionless)
 33 - tBodyAccMag-mean  | (numeric, dimensionless)
 34 - tBodyAccMag-std  | (numeric, dimensionless)
 35 - tGravityAccMag-mean  | (numeric, dimensionless)
 36 - tGravityAccMag-std  | (numeric, dimensionless)
 37 - tBodyAccJerkMag-mean  | (numeric, dimensionless)
 38 - tBodyAccJerkMag-std  | (numeric, dimensionless)
 39 - tBodyGyroMag-mean  | (numeric, dimensionless)
 40 - tBodyGyroMag-std  | (numeric, dimensionless)
 41 - tBodyGyroJerkMag-mean  | (numeric, dimensionless)
 42 - tBodyGyroJerkMag-std  | (numeric, dimensionless)
 43 - fBodyAcc-mean-X  | (numeric, dimensionless)
 44 - fBodyAcc-mean-Y  | (numeric, dimensionless)
 45 - fBodyAcc-mean-Z  | (numeric, dimensionless)
 46 - fBodyAcc-std-X  | (numeric, dimensionless)
 47 - fBodyAcc-std-Y  | (numeric, dimensionless)
 48 - fBodyAcc-std-Z  | (numeric, dimensionless)
 49 - fBodyAccJerk-mean-X  | (numeric, dimensionless)
 50 - fBodyAccJerk-mean-Y  | (numeric, dimensionless)
 51 - fBodyAccJerk-mean-Z  | (numeric, dimensionless)
 52 - fBodyAccJerk-std-X  | (numeric, dimensionless)
 53 - fBodyAccJerk-std-Y  | (numeric, dimensionless)
 54 - fBodyAccJerk-std-Z  | (numeric, dimensionless)
 55 - fBodyGyro-mean-X  | (numeric, dimensionless)
 56 - fBodyGyro-mean-Y  | (numeric, dimensionless)
 57 - fBodyGyro-mean-Z  | (numeric, dimensionless)
 58 - fBodyGyro-std-X  | (numeric, dimensionless)
 59 - fBodyGyro-std-Y  | (numeric, dimensionless)
 60 - fBodyGyro-std-Z  | (numeric, dimensionless)
 61 - fBodyAccMag-mean  | (numeric, dimensionless)
 62 - fBodyAccMag-std  | (numeric, dimensionless)
 63 - fBodyBodyAccJerkMag-mean  | (numeric, dimensionless)
 64 - fBodyBodyAccJerkMag-std  | (numeric, dimensionless)
 65 - fBodyBodyGyroMag-mean  | (numeric, dimensionless)
 66 - fBodyBodyGyroMag-std  | (numeric, dimensionless)
 67 - fBodyBodyGyroJerkMag-mean  | (numeric, dimensionless)
 68 - fBodyBodyGyroJerkMag-std  | (numeric, dimensionless)