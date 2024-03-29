---
title: "README"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

The run_analysis.R script cleans and tidies this dataset https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. The script:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


The data were collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at this site:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. The experiments were carried out with a group of 30 volunteers aged 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the experimenters captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 