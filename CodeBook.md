---
title: "CodeBook.md"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

This code book  describes the variables, the data, and the transformations performed to clean up the UCI wearable computing data.

**Data source **

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



**Variables**

features: contains the features of the database that come from the accelerometer and gyroscope 3-axial raw signals
activity_labels: contains the activity name labels
subject_train: contains the subject number identifiers for the training dataset
x_train: contains the experimental training dataset
y_train: contains the activities names for the training dataset
subject_test: contains the subject number identifiers for the training dataset
x_test: contains the experimental training dataset
y_test: contains the activities names for the test dataset
combined_train: containes the complete training dataset
combined_test: contains the complete test dataset
all_data: contains the combined training and test dataset
mean_std_cols: identifies all columns that have "mean" or "std" in their name
subject_col: contains the subjects in the training and test datasets
activity_col: contains the activities from the training and test datasets
mean_std_data: contains only the subjects, activities, and columns that have "mean" or "std" in their name from the all_data
my_tidy_data: contains the tidy tidy dataset with the average of each variable for each activity and each subject 


**Transformations**
all_data was created by using cbind and rbind to combine training and test data.
mean_std_data was created by extracting only the columns with "mean" or "std" in their names from the all_data dataset, then adding the subject and activity columns using cbind and rbind
the mutate() function was used to label the activities in mean_std_data
gsub() was used to correct a typo in the variable names (replacing "BodyBody" with "Body")
group_by() was used to group mean_std_data by subject and activity, and summarize_all() was used to calculate the average of each variable for each activity for each subject; this required the dplyr package and chaining.
