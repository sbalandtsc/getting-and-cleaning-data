# This script uses this dataset https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and:
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set.
# Appropriately labels the data set with descriptive variable names.
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(dplyr)
library(data.table)

features <- read.table("./UCI_HAR_Dataset/features.txt", header = FALSE)
activity_labels <- read.table("./UCI_HAR_Dataset/activity_labels.txt", header = FALSE)

#read training data
subject_train <- read.table("./UCI_HAR_Dataset/train/subject_train.txt", header = FALSE)
x_train <- read.table("./UCI_HAR_Dataset/train/X_train.txt", header = FALSE)
y_train <- read.table("./UCI_HAR_Dataset/train/Y_train.txt", header = FALSE)

#read test data
subject_test <- read.table("./UCI_HAR_Dataset/test/subject_test.txt", header = FALSE)
x_test <- read.table("./UCI_HAR_Dataset/test/X_test.txt", header = FALSE)
y_test <- read.table("./UCI_HAR_Dataset/test/Y_test.txt", header = FALSE)

#rename the columns with descriptive names
names(x_train) <- features$V2
names(x_test) <- features$V2
names(y_train) <- "activities"
names(y_test) <- "activities"
names(subject_train) <- "subject"
names(subject_test) <- "subject"

#add subject and activities to train and test datasets
combined_train <- cbind(subject_train, x_train, y_train)
combined_test <- cbind(subject_test, x_test, y_test)

#merge training and test datasets
all_data <- rbind(combined_train, combined_test)

#extract only the mean and standard deviation for each measurement
mean_std_cols <- grep("mean|std", names(all_data))
mean_std_data <- all_data[,mean_std_cols]

#asign descriptive activity names to the activities in the data set
subject_col <- rbind(subject_train, subject_test)
activity_col <- rbind(y_train, y_test)
mean_std_data <- cbind(subject_col, activity_col, mean_std_data)
mean_std_data <- mean_std_data %>% 
  arrange(activities) %>% 
  mutate(activities = as.character(factor(activities, levels=1:6, 
                                         labels= activity_labels$V2)))

#fix the typo in the variable names
names(mean_std_data)<-gsub("BodyBody", "Body", names(mean_std_data))

#create a tidy data set with the average of each variable for each activity and each subject
my_tidy_data <- mean_std_data %>% group_by(subject,activities) %>% summarise_all(mean)
write.table(my_tidy_data, "TidyData.txt", row.name=FALSE)