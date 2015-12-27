
# Readme #

## Principles ##

### first set of tidy data ###
The script presented here constructs first a tidy set of data with all 561 features variables

2 columns are added at the beginning:

* "subject_id" = the test subject id number (1 to 30)
* "activity" = the activity name (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

The other columns (the measurements columns) are then *selected* in order to keep only means and standard deviations measurements (66 matching columns). The selection is based on the column name:

* Standard deviations column names match the pattern "-std"
* Means : match "-mean", but not "-meanFreq"

These variables have each a name derived from the original names (the "special characters" "()"  have only been removed).
These names are as descriptive as possible and their definition was provided in "feature_info.txt". 
As the concept behind each name is complicated enough, its seems difficult to find  more explicit short names.

The first tidy dataset thus contains 2 + 66 = 68 variables, and 10299 rows (observations)

### Summary - second set of tidy data ###
A new dataset containing the mean of each variable for each combination subject-activity is computed using functions `melt` and `dcast`, from the package `reshape2` .

A "wide" form of data is generated in the process:

* one row for each combination subject-activity
* two id columns (subject_id + activity) + one column for each measurement variable, containing the appropriate mean.

The name of each measurement variable has been kept, although their values are not anymore the value of the original variable, but their mean, for each combination subject-activity 

This final datasets contains 2 + 66 = 68 variables, and 180 rows (observations)


## R code ##

The R script in run_analysis.R has the following characteristics.

1. Basic requirement: the data is assumed to have been downloaded and unzipped , generating a subdirectory "UCI HAR Dataset" **in the current work directory**

2. Script run: as the script is executed, a series of messages informs the user about the task currently performed by the script.

3. Steps 1 to 4 of the assignment:

 + the script reads the two common elements: activity_labels.txt, and features.txt, and prepares the features vector for use.
 + for the test dataset, the three components datasets (subject id (file "subject_test"), activity ("y_test"") , and measurements ("X_test") are read, prepared for assembly and assembled to form  the test dataframe.
 + the same operations are performed again for the training dataframe.
 + the two dataframes are combined with `rbind`.
 + the "means" and "standard deviations" variables are then selected and the result is the first tidy dataset, assigned to the variable `okdata`.

4. Step 5

 + The variables of the previous dataframe are then summarized using the functions `melt` and `dcast` of the pachage`reshape2`. The result is the final tidy dataset, assigned to the variable `s_okdata` and saved in "summary.txt". 

It is possible to read and view this dataset in RStudio using the following code (if "summary.txt" is in your work directory):
````
tidy <- read.table("summary.txt", header=TRUE)
View(tidy)
````
