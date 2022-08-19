## Getting and Cleaning Data Assignment

# Set working directory as required so it contains the folder with the data 

setwd(".")

#Zip file with data can also be downloaded with this link
# link <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# data_zip <- download(link)
# unzip

# Merges the training and the test sets to create one data set.
# load required libraries
library("dplyr")
# Read features
features <- read.table("./UCI HAR Dataset/features.txt")
features$unique <- make.unique(as.character(features$V2),sep="_")
# Read activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activity_labels) <- c("labels","activity")

# Read training data
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
colnames(x_train) <- features$V2
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
colnames(y_train) <- c("labels")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
colnames(subject_train) <- c("subject")

body_acc_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
body_acc_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
body_acc_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")

body_gyro_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
body_gyro_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
body_gyro_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")

total_acc_x_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
total_acc_y_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
total_acc_z_train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")

colnames(body_acc_x_train) <- paste("body_acc_x_",c(1:length(colnames(body_acc_x_train))),sep="")
colnames(body_acc_y_train) <- paste("body_acc_y_",c(1:length(colnames(body_acc_y_train))),sep="")
colnames(body_acc_z_train) <- paste("body_acc_z_",c(1:length(colnames(body_acc_z_train))),sep="")

colnames(body_gyro_x_train) <- paste("body_gyro_x_",c(1:length(colnames(body_gyro_x_train))),sep="")
colnames(body_gyro_y_train) <- paste("body_gyro_y_",c(1:length(colnames(body_gyro_y_train))),sep="")
colnames(body_gyro_z_train) <- paste("body_gyro_z_",c(1:length(colnames(body_gyro_z_train))),sep="")

colnames(total_acc_x_train) <- paste("total_acc_x_",c(1:length(colnames(total_acc_x_train))),sep="")
colnames(total_acc_y_train) <- paste("total_acc_y_",c(1:length(colnames(total_acc_y_train))),sep="")
colnames(total_acc_z_train) <- paste("total_acc_z_",c(1:length(colnames(total_acc_z_train))),sep="")


train <- cbind(subject_train ,y_train, x_train, 
               body_acc_x_train, body_acc_y_train,body_acc_z_train,
               body_gyro_x_train, body_gyro_y_train,body_gyro_z_train,
               total_acc_x_train, total_acc_y_train,total_acc_z_train)


# Read test data
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
colnames(x_test) <- features$V2
y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
colnames(y_test) <- c("labels")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
colnames(subject_test) <- c("subject")

body_acc_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
body_acc_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
body_acc_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")

body_gyro_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
body_gyro_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
body_gyro_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")

total_acc_x_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
total_acc_y_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
total_acc_z_test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")

colnames(body_acc_x_test) <- paste("body_acc_x_",c(1:length(colnames(body_acc_x_test))),sep="")
colnames(body_acc_y_test) <- paste("body_acc_y_",c(1:length(colnames(body_acc_y_test))),sep="")
colnames(body_acc_z_test) <- paste("body_acc_z_",c(1:length(colnames(body_acc_z_test))),sep="")

colnames(body_gyro_x_test) <- paste("body_gyro_x_",c(1:length(colnames(body_gyro_x_test))),sep="")
colnames(body_gyro_y_test) <- paste("body_gyro_y_",c(1:length(colnames(body_gyro_y_test))),sep="")
colnames(body_gyro_z_test) <- paste("body_gyro_z_",c(1:length(colnames(body_gyro_z_test))),sep="")

colnames(total_acc_x_test) <- paste("total_acc_x_",c(1:length(colnames(total_acc_x_test))),sep="")
colnames(total_acc_y_test) <- paste("total_acc_y_",c(1:length(colnames(total_acc_y_test))),sep="")
colnames(total_acc_z_test) <- paste("total_acc_z_",c(1:length(colnames(total_acc_z_test))),sep="")


test <- cbind(subject_test ,y_test, x_test, 
               body_acc_x_test, body_acc_y_test,body_acc_z_test,
               body_gyro_x_test, body_gyro_y_test,body_gyro_z_test,
               total_acc_x_test, total_acc_y_test,total_acc_z_test)

# combine test and train data

all_data <- rbind(train,test)

# Extracts only the measurements on the mean and standard deviation for each measurement. 
all_mean <- NULL
all_sd <- NULL
for(i in 3:length(colnames(all_data))){
  all_mean[i] <- mean(all_data[,i])
  all_sd[i] <- sd(all_data[,i])
}
measures <- data.frame(colnames(all_data),all_mean, all_sd)

# Uses descriptive activity names to name the activities in the data set
merge_activity <- merge(activity_labels, all_data, by="labels")

# a simplified way for mean and sd task
merge_activity$subject <- as.factor(merge_activity$subject)
merge_activity$labels <- as.factor(merge_activity$labels)
m2 <- merge_activity %>% summarise_if(is.numeric, mean, na.rm = TRUE)
m3 <- merge_activity %>% summarise_if(is.numeric, sd, na.rm = TRUE)

# Appropriately labels the data set with descriptive variable names.
# done above

# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

merge_activity <- group_by(merge_activity, activity, subject)
average_all <- summarize_all(merge_activity, mean)

merge_activity$subject <- as.factor(merge_activity$subject)
merge_activity <- group_by(merge_activity, activity)
average_activity <- merge_activity %>% group_by(activity) %>% 
  summarise_if(is.numeric, mean, na.rm = TRUE)

merge_activity$labels <- as.factor(merge_activity$labels)
average_subject <- merge_activity %>% group_by(subject) %>%
  summarise_if(is.numeric, mean, na.rm = TRUE)

# generate a file with tidy data
write.csv(merge_activity, file="tidy_data.csv")
aux <- read.csv("tidy_data.csv", header=TRUE)
          