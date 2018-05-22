library(mgsub)
library(dplyr)

##Reading raw data##

testdata<- read.table("test/X_test.txt")
testlabels<-read.table("test/y_test.txt")
traindata<-read.table("train/X_train.txt")
trainlabels<-read.table("train/Y_train.txt")
variablenames<-read.table("features.txt")
testsubjects<-read.table("test/subject_test.txt")
trainsubjects<-read.table("train/subject_train.txt")
activitylabel<-read.table("activity_labels.txt")

##merging data sets to get the combined train and test data##

mergedsubjects<-rbind(testsubjects,trainsubjects)
mergedlabels<-rbind(testlabels,trainlabels)
mergedlabels<-sapply(mergedlabels,function(x) activitylabel[[2]][x])
mergeddata<-rbind(testdata,traindata)

##Providing descriptive and appropriate variable names##

colnames(mergeddata)<-paste(variablenames$V2)
extractdata<-mergeddata[,grep("*mean[()]|*std",names(mergeddata))]
cleannames<-mgsub(names(extractdata),c("BodyBody","tBody","tGravity","f"),c("body","timebody","timegravity","freq"))
colnames(extractdata)<-paste(tolower(cleannames))
colnames(mergedlabels)<-paste("Activity")
colnames(mergedsubjects)<-paste("Subjects")

## Getting tidy data set ##

tidyset<-cbind(mergedsubjects,mergedlabels,extractdata)
tidyset %>%
group_by(Subjects,Activity) %>%
summarize_all(funs(mean))%>%
write.table(file="output.txt",row.names=FALSE)

