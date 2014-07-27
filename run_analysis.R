### Programing assignement for the Getting and Cleaning Data course
### Part of the Coursera Data Science Track.

### Download and unizp the files
if(!file.exists(".\\UCI")){dir.create(".\\UCI")}
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile=".\\UCI\\zipado.zip",method="auto")
unzip(".\\UCI\\zipado.zip")
file.rename(".\\UCI HAR Dataset", ".\\UCI")


### Merge "train" and "test" files and label columns
features=read.table(".\\UCI\\features.txt",sep=" ",header=FALSE)
test=read.table(".\\UCI\\test\\X_test.txt",header=FALSE)
train=read.table(".\\UCI\\train\\X_train.txt",header=FALSE)
final=rbind(train,test)
names(final)=features[,2]

###Include activity labels in the data frame
trainlabels=read.table(".\\UCI\\train\\y_train.txt",header=FALSE)
testlabels=read.table(".\\UCI\\test\\y_test.txt",header=FALSE)
labelsfinal=rbind(trainlabels,testlabels)

###Include subject information in the data frame
trains=read.table(".\\UCI\\train\\subject_train.txt",header=FALSE)
tests=read.table(".\\UCI\\test\\subject_test.txt",header=FALSE)
sfinal=rbind(trains,tests)

####Extracts only the measurements on the mean and standard deviation for each measurement.
media=final[,grep("mean",names(final))]
stdtable=final[,grep("std",names(final))]
stdmean=cbind("subject"=sfinal,"activity"=labelsfinal,media,stdtable)
names(stdmean)[1:2]=c("subject","activity")

###Creates a second tidy data set with the average of each variable for each activity and each subject. 
tidy=aggregate(stdmean,by=list(stdmean[,2],stdmean[,1]), mean)

###Relabels activities and organizes table
alabels=read.table(".\\UCI\\activity_labels.txt",header=FALSE)
tidy=merge(alabels,tidy,by.x="V1",by.y="activity")
tidy=tidy[order(tidy[,5],tidy[,1]),]
tidy=tidy[,c(5,2,6:84)]
row.names(tidy)=c(1:180)
names(tidy)[2]="activity"

###saves a file and cleans up the workspace
save(tidy, "tidy.txt")
rm(list=ls())
load("tidy.txt")
