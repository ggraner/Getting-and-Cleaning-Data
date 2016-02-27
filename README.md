## Getting and Cleaning Data Course Project

### Introduction
The goal of the Project is to prepare tidy data that can be used for later analysis. 
Data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
A full descrition of the data is available at this site: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Files 
- README.md
- CodeBook.Rmd
- run_analysis.R
- run_analysis_tidy.csv

### Scheme
The R scrpit *run_analysis.R* does the following: 
1. create the directory ./data if not already exists. 
2. downloads the data source and put in ./data folder
3. extracts the downloaded *.zip.file
4. reads the data set into data.tables
5. merges the test and the training set into one table
6. prepares merged data by removing duplicated column names, using descriptive activity names and appropriate labels
7. creates the mean of each variable for each activity and each subject
8. writes the tidy data set to a new file in the working directory called: *run_analysis_tidy.csv*

### Dependencies
- data.table library
- dplyr library

