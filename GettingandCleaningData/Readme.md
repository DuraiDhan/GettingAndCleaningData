#run_analysis.R detail
##Actions
	1. Load the feature list, train and test data set.
	2. After loading feature will clean up column names create meaning full names of each sensor column.
	3. Create the merged data set from train and test with appropriate column names (sensor).
	4. Create a selected data set which includes only mean and STD columns of each sensors
	5. Create a tidy data set which contains only one column which is the mean of each selected columns.
	
##Prerequisite:
	1. Make sure run_analysis.R exist in the main folder and the sub folder be the "UCI HAR Dataset"
	2. "UCI HAR Dataset" contains feature list and sub folders "train" & "test" with bunch of sensor observations files.
	3. Command to run is runAnalysis("C:\\DSToolKit\\GettingandCleaningData\\") if the mentioned path is the main directory.
		
##Note:
	1. Since the train and test data set is huge, depending upon the machine's performance the loading time of dataset will vary.  
