##Data

The tidy_data.txt data file is a text file which has been cleaned up. 

The first row contains the names of the variables, which are listed and described in the Variables section, and the following rows contain the values of these variables.


##Variables

#subject
- Subject identifier, integer, ranges from 1 to 30.

activity

#Activity identifier, string with 6 possible values:

-WALKING: subject was walking
-WALKING_UPSTAIRS: subject was walking upstairs
-WALKING_DOWNSTAIRS: subject was walking downstairs
-SITTING: subject was sitting
-STANDING: subject was standing
-LAYING: subject was laying

##Work

-Merges the training and the test sets to create one data set.
-Extracts only the measurements on the mean and standard deviation for each measurement.
-Uses descriptive activity names to name the activities in the data set
-Appropriately labels the data set with descriptive variable names.
-From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.