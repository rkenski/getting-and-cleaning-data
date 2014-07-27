getting-and-cleaning-data
=========================

Course Project for Getting and Cleaning Data at Coursera's Data Track

Introduction
The script downloads data “Human Activity Recognition Using Smartphones Dataset, version 1.0”, collected from the accelerometers from the Samsung Galaxy S smartphone by researchers at the “Smartlab - Non Linear Complex Systems Laboratory”, in Genoa, Italy. 
More information about it can be found in:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The script then cleans and processes the data in order to produced a smaller tidy data set. This new data set - “tidy.txt” - merges test and training files and provides a summary of the means and standard deviations in relation to activities and subjects.

This repository contains:
- tidy.txt : a space-delimited text file that provides a tidy data set as described below
- run_analysis.R : an R script that downloads the raw data files, cleans and summarizes them and produces tidy.txt
- CodeBook.md : a markdown document describing the variables and data in tidy.txt and the assumptions of the cleaning process. 
- README.md : the current document, with an explanation of the process and its elements. 

How to run the run_analysis script:
-	Extract the file to your current R working directory
-	Run the script
