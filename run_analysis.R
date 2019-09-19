run_analysis<-function () {
   
   library(dplyr) #to use mutate and select
    library(reshape2) #to use melt and dcast functions
   
    #the next functions are to load the .txt files into R. To work you need to set the Working Directory 
   activity_labels=read.table("./activity_labels.txt")
   features=read.table("./features.txt")
   X_test=read.table("./test/X_test.txt")
   y_test=read.table("./test/y_test.txt")
   subject_test=read.table("./test/subject_test.txt")
   X_train=read.table("./train/X_train.txt")
   y_train=read.table("./train/y_train.txt")
   subject_train=read.table("./train/subject_train.txt")
   
  
   names_X<-c(paste0(features$V1,"_",as.character(features$V2))) #Create unique names for X dataset variables
   
   #Make "test" dataset tidy 
   names(X_test)<-names_X #Add names to columns (or variables)
   y_test$V1<-as.factor(y_test$V1) #Convert y_test to Factor to easily change numbers to categorical data
   levels(y_test$V1)<-activity_labels$V2 #Change numbers to labels on y_test to make it more descriptive
   X_test<-tbl_df(X_test) #Convert X_test to tbl_df for easy manipulation with dplyr functions
   X_test<-mutate(X_test,subject=subject_test$V1,activity=y_test$V1) #Add 2 columns: subject and activity
   
   #Perform same tidy process for "train" dataset
   names(X_train)<-names_X #Add names to columns (or variables)
   y_train$V1<-as.factor(y_train$V1) #Convert y_train to Factor to easily change numbers to categorical data
   levels(y_train$V1)<-activity_labels$V2 #Change numbers to labels on y_train to make it more descriptive
   X_train<-tbl_df(X_train) #Convert X_train to tbl_df for easy manipulation with dplyr functions
   X_train<-mutate(X_train,subject=subject_train$V1,activity=y_train$V1) #Add 2 columns: subject and activity
   
   #Convert and clean "train" and "test" dataset into one (SmarphonesData)
   SmartphonesData<-rbind(X_test,X_train) #Merge both datasets
   SmartphonesData<-select(SmartphonesData,subject,activity,contains("mean"),contains("std")) #Select just subject, activity and mean and std deviation for each measurement
   
   #Create second dataset with Summary 
   Data_Names<-names(SmartphonesData) #Extract dataset names for further processing
   Data_Names<-Data_Names[-(1:2)] #Select all names except "subject" and "activity" since these are the variables we want to group by
   SummarySmartphonesData<-melt(SmartphonesData,id=c("subject","activity"),measure.vars = Data_Names) #with this function we grab all the columns (or variables) data and put it in two columns: variable= name of the column and value= column value in that combination of subject & activity
   SummarySmartphonesData<-dcast(SummarySmartphonesData,subject + activity ~ variable,mean) #We obtain the mean of all the values of each variable with the same combination of subject & activity

}