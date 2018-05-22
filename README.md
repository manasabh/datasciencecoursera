# This project indends to provide tidy data set for Human Activity Recognition Using Smartphones Data Set 
Firstly raw data is downloaded and read using read.table with the dataset provided in the files for train and test data.
Data is merged to obtain a combined dataset. The activity labels  and subject information is joined to the dataset to provide a comprehensive dataset. As part of the project, mean and standard deviation are the only two functions to be extracted among the variables provided for dataset. The newdataset is provided with descriptive variable names and descriptive activity labels.
Secondly once we have a tidy dataset we can calculate the mean of the variables by grouping each subject and then grouping by activity.

