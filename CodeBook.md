Data Directory

Data was collected from the Human Activity Recognition Using Smartphones Dataset.
The tidydataset.txt was made using the run_analysis.R code with the
dataset specified above
activity label -- identifies the activity being performed the subject
        1 WALKING
        2 WALKING_UPSTAIRS
        3 WALKING_DOWNSTAIRS
        4 SITTING
        5 STANDING
        6 LAYING
subject -- identifies the subject who performed the activity
        1:30 
features -- the data types collected summarized by mean and standard deviation
*"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions."

        tBodyAcc-XYZ -split by axis of x,y, and z respectively
        tGravityAcc-XYZ -split by axis of x,y, and z respectively
        tBodyAccJerk-XYZ -split by axis of x,y, and z respectively
        tBodyGyro-XYZ -split by axis of x,y, and z respectively
        tBodyGyroJerk-XYZ -split by axis of x,y, and z respectively
        tBodyAccMag
        tGravityAccMag
        tBodyAccJerkMag
        tBodyGyroMag
        tBodyGyroJerkMag
        fBodyAcc-XYZ -split by axis of x,y, and z respectively
        fBodyAccJerk-XYZ -split by axis of x,y, and z respectively
        fBodyGyro-XYZ -split by axis of x,y, and z respectively
        fBodyAccMag
        fBodyAccJerkMag
        fBodyGyroMag
        fBodyGyroJerkMag
*feature description exert from the official data set code book