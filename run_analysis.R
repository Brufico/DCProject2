#### =====================================================================
#### Programming assignment for "Getting and Cleaning Data"
#### =====================================================================


# Package reshape2 is used in the summarizing part (5)
message("This script uses package 'reshape2'. Install it first if needed")
message("loading package reshape2...")
library(reshape2)


#### ===================================================================== 
#### steps 1, 2,3, 4 
#### Constructing a tidy dataset for all the data (test+training) together 
#### =====================================================================



### Reading and assembling the data elements in R ========================
message("The data must be in subdir 'UCI HAR Dataset' of the working directory")


## common elements--------------------------------------------------------
message("reading and cleaning common data elements...")

# the activity codenum-label table + the feature codenum-label table
ac <- read.table(file.path("UCI HAR Dataset" , "activity_labels.txt"))
feat <- read.table(file.path("UCI HAR Dataset" , "features.txt"))

# making a vector of legal column names with the features names 
# i.e. substituting '()', ')', '(', ')'  and '-' with an empty string.
feat <- gsub("\\(",
             "",
             gsub("\\)",
                  "",
                  gsub("\\()","",feat[,2])))




## the test set data------------------------------------------------------
message("reading test set data...")

# su_dta (=the test subjects) + y_dta (= the activities) + X_dta (= the measurements)
su_dta <- read.table(file.path("UCI HAR Dataset" , "test", "subject_test.txt"))
y_dta <- read.table(file.path("UCI HAR Dataset" , "test", "y_test.txt"))
X_dta <- read.table(file.path("UCI HAR Dataset" , "test", "X_test.txt"))


message("cleaning and assembling test set data...")

# Make 'y_dta' a factor with activity labels instead of activity num codes  
y_dta[,1] <- factor( sapply(y_dta[,1], FUN=function(j){ac[j,2]}), 
                     ac[ , 2])

# assembling the three dataframes (column-wise)
testdata <- cbind(su_dta, y_dta, X_dta)
# set the column names
names(testdata)<-c("subject_id", "activity", feat)



## the training set data (same procedure as test set)---------------------
message("reading training set data (large dataset - may take a while)...")

su_dta <- read.table(file.path("UCI HAR Dataset" , "train", "subject_train.txt"))
y_dta <- read.table(file.path("UCI HAR Dataset" , "train", "y_train.txt"))
X_dta <- read.table(file.path("UCI HAR Dataset" , "train", "X_train.txt"))

message("cleaning and assembling training set data...")

y_dta[,1] <- factor( sapply(y_dta[,1], FUN=function(j){ac[j,2]}), 
                       ac[ , 2])
traindata <- cbind(su_dta, y_dta, X_dta)
names(traindata) <- c("subject_id", "activity", feat)





### Combining the elements ===============================================
message("Combining  test and training data sets...")

okdata <- rbind(traindata,testdata)

## clean the environnment of obsolete large data frames
rm(list=c("su_dta", "y_dta", "X_dta", "testdata", "traindata"))


### select mean and std dev measurements variables (keeping  subject + activity names)
message("Selecting only mean and std.dev variables...")

# Matching names of  "means" variables in the feature names vector (feat)
is_mean1 <- grepl("-mean", feat, fixed=TRUE)
is_mean2 <- grepl("-meanFreq", feat, fixed=TRUE)
is_mean <- is_mean1 & !is_mean2
# same for std devs
is_std <- grepl("-std", feat, fixed=TRUE)
# combined: return the index of columns
is_ok <- which(is_mean | is_std)

# final first tidy data set (end of step 4) stored in 'okdata'
col_ok <- c(1, 2, is_ok + 2)
okdata <- okdata[ , col_ok]





#### =====================================================================
#### step 5 summarizing and reshaping the data
#### =====================================================================

message("summarizing the data...")
# melt and cast (and get wide form)
m_okdata <- melt(okdata, id.vars=c("subject_id", "activity"))
s_okdata <- dcast(m_okdata, subject_id + activity ~ variable, mean)

## Writing the result---------------------------------------------------------
write.table(s_okdata, file="summary.txt", row.name=FALSE)

# the end -------------------------------------------------------------------
message("process finished : the result is in the variable 's_okdata' and the file 'summary.txt'")

