# GettingAndCleaningDataProject
## Overview
This file describes the operations in the run_analysis.R script. Essentially the script takes data from the Human Activity Recognition Using Smartphones Dataset combines it and cleans it up. The original data can be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Getting the Data
*The original data is in a number of different files:*
activity_labels.txt     (numbers indicating the activity)
features.txt               (column, i.e. “variable”, names for the “X” data files)
subject_test.txt        (test subject identifier, i.e. one of the study volunteers)
X_test.txt                  (the normalized observation data and some stats from observations like “mean”)
y_test.txt                  (data file with another column for the X data files, the activity # 1 through 6)
subject_train.txt       (test subject identifier, i.e. one of the study volunteers)
X_train.txt                 (the normalized observation data and some stats from observations like “mean”)
y_train.txt                 (data file with another column for the X data files, the activity # 1 through 6)
