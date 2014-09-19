# Code book for Tidy Data Set project

Raw data came from: Human Activity Recognition Using Smartphones Dataset, Version 1.0 [1]
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This data was spread across 6 files. They were combined into one, more readable file and filtered for means and stds, as follows:
* Data was originally in 3 files for training data, 3 files for testing data. Each group of 3 files consisted of subject, activity labels, and data
* The training and testing files were merged, reducing the number of files from 6 to 3
* The 3 remaining files were merged such that subject is column 1, activity labels column 2, and data is column 3 through 563
* The resulting 563 column dataframe was reduced to 81 columns by selecting only columns with "mean" or "std"
* The activities values had digit codes replaced with the activity label to make to make for easier reading
* Columns names were assigned with "subject" for column 1, "activity" for column 2, and features from the features.txt file assigned as names to corresponding columns

The data originally consisted of 10,299 observations across 30 subjects, each with multiple observations for 6 activities. This was summarized by averaging all observations per subject and activity, reducing the number of records from 10,299 down to 180. This final data frame is 180 observations x 81 variables.

## List of the 81 variables:

subject: Integer between 1 and 30 which references one of 30 human subjects in the experiment that performed the activity for the observation.

activity: 1 of 6 possible strings to indicate activity performed by subject: {WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING}

The remaining 79 variables are the same names as used with source data and are preceded by an integer indicated their column number in the original data:

```
   1               tBodyAcc-mean()-X
   2               tBodyAcc-mean()-Y
   3               tBodyAcc-mean()-Z
   4                tBodyAcc-std()-X
   5                tBodyAcc-std()-Y
   6                tBodyAcc-std()-Z
  41            tGravityAcc-mean()-X
  42            tGravityAcc-mean()-Y
  43            tGravityAcc-mean()-Z
  44             tGravityAcc-std()-X
  45             tGravityAcc-std()-Y
  46             tGravityAcc-std()-Z
  81           tBodyAccJerk-mean()-X
  82           tBodyAccJerk-mean()-Y
  83           tBodyAccJerk-mean()-Z
  84            tBodyAccJerk-std()-X
  85            tBodyAccJerk-std()-Y
  86            tBodyAccJerk-std()-Z
 121              tBodyGyro-mean()-X
 122              tBodyGyro-mean()-Y
 123              tBodyGyro-mean()-Z
 124               tBodyGyro-std()-X
 125               tBodyGyro-std()-Y
 126               tBodyGyro-std()-Z
 161          tBodyGyroJerk-mean()-X
 162          tBodyGyroJerk-mean()-Y
 163          tBodyGyroJerk-mean()-Z
 164           tBodyGyroJerk-std()-X
 165           tBodyGyroJerk-std()-Y
 166           tBodyGyroJerk-std()-Z
 201              tBodyAccMag-mean()
 202               tBodyAccMag-std()
 214           tGravityAccMag-mean()
 215            tGravityAccMag-std()
 227          tBodyAccJerkMag-mean()
 228           tBodyAccJerkMag-std()
 240             tBodyGyroMag-mean()
 241              tBodyGyroMag-std()
 253         tBodyGyroJerkMag-mean()
 254          tBodyGyroJerkMag-std()
 266               fBodyAcc-mean()-X
 267               fBodyAcc-mean()-Y
 268               fBodyAcc-mean()-Z
 269                fBodyAcc-std()-X
 270                fBodyAcc-std()-Y
 271                fBodyAcc-std()-Z
 294           fBodyAcc-meanFreq()-X
 295           fBodyAcc-meanFreq()-Y
 296           fBodyAcc-meanFreq()-Z
 345           fBodyAccJerk-mean()-X
 346           fBodyAccJerk-mean()-Y
 347           fBodyAccJerk-mean()-Z
 348            fBodyAccJerk-std()-X
 349            fBodyAccJerk-std()-Y
 350            fBodyAccJerk-std()-Z
 373       fBodyAccJerk-meanFreq()-X
 374       fBodyAccJerk-meanFreq()-Y
 375       fBodyAccJerk-meanFreq()-Z
 424              fBodyGyro-mean()-X
 425              fBodyGyro-mean()-Y
 426              fBodyGyro-mean()-Z
 427               fBodyGyro-std()-X
 428               fBodyGyro-std()-Y
 429               fBodyGyro-std()-Z
 452          fBodyGyro-meanFreq()-X
 453          fBodyGyro-meanFreq()-Y
 454          fBodyGyro-meanFreq()-Z
 503              fBodyAccMag-mean()
 504               fBodyAccMag-std()
 513          fBodyAccMag-meanFreq()
 516      fBodyBodyAccJerkMag-mean()
 517       fBodyBodyAccJerkMag-std()
 526  fBodyBodyAccJerkMag-meanFreq()
 529         fBodyBodyGyroMag-mean()
 530          fBodyBodyGyroMag-std()
 539     fBodyBodyGyroMag-meanFreq()
 542     fBodyBodyGyroJerkMag-mean()
 543      fBodyBodyGyroJerkMag-std()
 552 fBodyBodyGyroJerkMag-meanFreq()
```

## From features_info.txt file from the source data:
 
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

```
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
```

The set of variables that were estimated from these signals are: 

```
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
angle(): Angle between to vectors.
```

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

```
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean
```