# Project for Coursera data science course: Getting and Cleaning Data (Leek, Peng, Caffo)

# The purpose of this project is to demonstrate collecting, working with, cleaning a data set.
# Goal: Prepare tidy data that can be easily used for later analysis.
# For more information:
#   README.md
#   Codebook.md

# Activity labels:

# 1 WALKING
# 2 WALKING_UPSTAIRS
# 3 WALKING_DOWNSTAIRS
# 4 SITTING
# 5 STANDING
# 6 LAYING

# read in activity labels (see above), features
activity_labels <- read.table("activity_labels.txt", header = FALSE)  # as above
features <- read.table("features.txt", header = FALSE)

# read in the subjects, data set, and activity labels for both training and test sets
train_subject <- read.table("train/subject_train.txt", header = FALSE)
train_data_set <- read.table("train/X_train.txt", header = FALSE)
train_labels <- read.table("train/y_train.txt", header = FALSE)  #activity label values

test_subject <- read.table("test/subject_test.txt", header = FALSE)
test_data_set <- read.table("test/X_test.txt", header = FALSE)
test_labels <- read.table("test/y_test.txt", header = FALSE)  #activity label values

# make sure there is no missing data
if (!(all(colSums(is.na(train_data_set))==0) & all(colSums(is.na(test_data_set))==0))) {
    print("There are missing data values, so cleanup is necessary")
}
if (!(all(colSums(is.na(train_subject))==0) & all(colSums(is.na(test_subject))==0))) {
    print("There are missing subject values, so cleanup is necessary")
}
if (!(all(colSums(is.na(train_labels))==0) & all(colSums(is.na(test_labels))==0))) {
    print("There are missing label values, so cleanup is necessary")
}

# merge training and test data (rows) as well as the 3 data tables subject, label_values, and data (columns)
subject <- rbind(train_subject, test_subject)
label_values <- rbind(train_labels, test_labels)  #activity label values
data <- rbind(train_data_set, test_data_set)
data <- cbind(subject, label_values, data)  # inserting 2 columns causes the index of each pre-existing column to increase by 2

# Extract mean and standard deviation related measurements (rows on features, but columns on data)
mean_and_std_indices <- sort(c(grep("mean", features$V2, fixed=TRUE), grep("std", features$V2, fixed=TRUE)))
subj_label_mean_std_indices <- c(1, 2, mean_and_std_indices + 2)  # account for 2 inserted columns by adding 2 to indices and inserting 1, 2
data <- data[,subj_label_mean_std_indices]

# apply descriptive activity names to name the activities in the data set, by substituting each number with appropriate label
data$V1.1 <- gsub('1', 'WALKING', data$V1.1)
data$V1.1 <- gsub('2', 'WALKING_UPSTAIRS', data$V1.1)
data$V1.1 <- gsub('3', 'WALKING_DOWNSTAIRS', data$V1.1)
data$V1.1 <- gsub('4', 'SITTING', data$V1.1)
data$V1.1 <- gsub('5', 'STANDING', data$V1.1)
data$V1.1 <- gsub('6', 'LAYING', data$V1.1)

# appropriately labels the data set with descriptive variable names, by relabling the columns

# first prepare list of new column names (which must be strings)
features_mean_and_std <- features[mean_and_std_indices,] # 46 with mean, 33 with std, for total of 79
features_mean_and_std <- data.frame(lapply(features_mean_and_std, as.character), stringsAsFactors=FALSE)

# then it's easy to relabel
colnames(data) <- c("subject", "activity", features_mean_and_std$V2)

# from resulting data set, create a second, independent tidy data set with the average of each variable for each activity and each subject
averages <- aggregate(. ~ activity + subject, data = data, FUN = "mean")

# To check that the above statement gets right results, compare output of following two statements:
# head(averages)  # displays averages for subject 1, with last of 6 rows being averages for WALKING_UPSTAIRS activity
# summary(data[data$activity=="WALKING_UPSTAIRS" & data$subject==1,])  # mean should match that of prior statement for each column

# write data set to text file





