#get and merge the data

setwd("/Users/MeghaPatel/Desktop/datasciencecoursera/UCI HAR Dataset")
library(plyr)
library(data.table)

Train = read.table('./train/subject_train.txt',header=FALSE)
xTrain = read.table('./train/x_train.txt',header=FALSE)
yTrain = read.table('./train/y_train.txt',header=FALSE)

Test = read.table('./test/subject_test.txt',header=FALSE)
xTest = read.table('./test/x_test.txt',header=FALSE)
yTest = read.table('./test/y_test.txt',header=FALSE)

x <- rbind(xTrain, xTest)
y <- rbind(yTrain, yTest)
sub <- rbind(Train, Test)

#extract only the measurements on th mean and SD for each measurement

x_mean_sd <- x[, grep("-(mean|std)\\(\\)", read.table("features.txt")[, 2])]
names(x_mean_sd) <- read.table("features.txt")[grep("-(mean|std)\\(\\)", read.table("features.txt")[, 2]), 2] 
View(x_mean_sd)


#use descriptive activity names to name the activities in the data set.


y[, 1] <- read.table("activity_labels.txt")[y[, 1], 2]
names(y) <- "Activity"
View(y)

#appropriately label the data set with descriptive activity names.

names(sub) <- "Subject"
summary(sub)

# Organizing and combining all data sets into single one.

data <- cbind(x_mean_sd, y, sub)

# Defining descriptive names for all variables.

names(data) <- make.names(names(data))
names(data) <- gsub('Acc',"Acceleration",names(data))
names(data) <- gsub('GyroJerk',"AngularAcceleration",names(data))
names(data) <- gsub('Gyro',"AngularSpeed",names(data))
names(data) <- gsub('Mag',"Magnitude",names(data))
names(data) <- gsub('^t',"TimeDomain.",names(data))
names(data) <- gsub('^f',"FrequencyDomain.",names(data))
names(data) <- gsub('\\.mean',".Mean",names(data))
names(data) <- gsub('\\.std',".StandardDeviation",names(data))
names(data) <- gsub('Freq\\.',"Frequency.",names(data))
names(data) <- gsub('Freq$',"Frequency",names(data))

View(data)

#Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
data2<-aggregate(. ~Subject + Activity, data, mean)
data2<-data2[order(data2$Subject,data2$Activity),]
write.table(data2, file = "tidydata.txt",row.name=FALSE)


