# Project: Preparing a Tidy Data Set
* Coursera data science course: Getting and Cleaning Data (Leek, Peng, Caffo)
* Data Analyst: Joe Golton
* Date: 9/19/14

## Introduction
The purpose of this project is to demonstrate collecting, working with, and cleaning a data set.
The goal is to prepare tidy data that can be easily used for later analysis.

Data Set used: Human Activity Recognition Using Smartphones Dataset, Version 1.0 [1]
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Before creating a tidy data set there are two setup steps:

* Download the above data set unzip it, which will create a folder called "UCI HAR Dataset"
* Place run_analysis.R in the UCI HAR Dataset folder and run it.

## Creating the Tidy Data Set

To create a tidy data set:

### 1) Merge training and test set to create one data set

This is done in several sub steps, some of which required making some decisions about the data:

* Read in activity labels (1 Walking, 4 Sitting, etc.), features
* Read in the subjects, data set, and activity labels for both training and test sets
* Make sure there is no missing data
* Merge training and test data (rows) as well as the 3 data tables subject, label_values, and data (columns). The explanatory files associated with the HAR data did not make it clear that row 1 of subject corresponded to row 1 of label_values and row 1 of data. Given that the number of rows was identical in all 3 of these files for training, and again for all 3 of the files for test, I made the assumption that the rows are indeed ordered identically, such that row 100 of each of the 3 test files, for example, all correpond to the same record. I had to make this assumption as there is no id in each of the 3 files that ties them together.

### 2) Extract mean and standard deviation related measurements

* Means and Standard Deviations are captured by searching for "mean" and "std" in the features.txt file that was read in to the variable features. This is the broadest possible interpretation of which variables are associated with a mean or sd. Once data is filtered out, you can't get it back. So my view was that it was better to have extra data that is unneeded rather than missing data that turns out to be important. That is why I did not try to cull data such as fBodyBodyGyroMag-meanFreq(), even though it is of a different character than tBodyAcc-mean()-X.
* Implementation note: Because subject and labels were inserted into data in columns 1 and 2, it was necessary to offset the rest of the indices by 2 in order to correctly pick out the columns of data asssoicated with mean and sd.
* Features were in rows in the feature vector, but column names in the data, so the code accounts for that.

### 3) Apply descriptive activity names to name the activities in the data set
* Substitute each number with activity label that was originally used by researchers, to make it easier to read but still maintaining the identical terminology to source data to make it easier for anyone who wants to go back and forth between source data and tidy data set.


### 4) Appropriately labels the data set with descriptive variable names
* For mean and sd variables, relabel columns with feature name originally used by researchers, to make it easier to read but still maintaining the identical terminology to source data to make it easier for anyone who wants to go back and forth between source data and tidy data set.
* The inserted 2 columns were named were subject and activity, as column 1 was the subject, and column 2 is the activity performed by the subject.

### 5) From resulting data set, create a second, independent tidy data set with the average of each variable for each activity and each subject
* After doing this with aggregate(), the results were checked. The code for doing this is commented out.
* This new table is saved to averages.txt
* To test that this file was written correctly, it can be read with: test1 <- data <- read.table("averages.txt", header = TRUE)
* This test was done but is commented out in the code.

## Files:
* README.md
* Codebook.md
* run_analysis.R  (input files: see original source files below, output file: averages.txt)
* Original source files: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip [1]



[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.