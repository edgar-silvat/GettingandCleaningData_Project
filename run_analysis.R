run_analysis<-function () {
   #This function gather info from .txt files, merge the datasets into one in a tidy form, get 2 tidy data tables: one 
    #with selected variables that contains mean and standard deviation and the second one with calculated average 
    #for each varible for each subject and activity combination. Finally returns both tables to visualize them.
    
    
   library(dplyr) #to use mutate and select
    library(reshape2) #to use melt and dcast functions
   
    #The next functions load the .txt files into R. 
    #To work you need to set the Working Directory in the same folder where all these .txt files are 
   activity_labels=read.table("./activity_labels.txt")
   features=read.table("./features.txt")
   X_test=read.table("./X_test.txt")
   y_test=read.table("./y_test.txt")
   subject_test=read.table("./subject_test.txt")
   X_train=read.table("./X_train.txt")
   y_train=read.table("./y_train.txt")
   subject_train=read.table("./subject_train.txt")
   
   #Create unique names for X dataset variables adding a number and an underscore as prefix. 
   #Otherwise you get an error when trying to convert the Data Frame to tbl_df for dplyr manipulation
   names_X<-c(paste0(features$V1,"_",as.character(features$V2))) 
   
   
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
   names(SmartphonesData)<-gsub("[0-9]+_","",names(SmartphonesData)) #Delete the number and underscore (previously added) from names
   names(SmartphonesData)<-gsub("\\(\\)","",names(SmartphonesData)) #Since parenthesis of this type "()" don't give any additional info, we delete them
   Data_Names<-names(SmartphonesData) #Extract dataset names for further processing
   Data_Names<-Data_Names[-(1:2)] #Select all names except "subject" and "activity" since these are the variables we want to group by
   
   SummarySmartphonesData<-melt(SmartphonesData,id=c("subject","activity"),measure.vars = Data_Names) #with this function we grab all the columns (or variables) data and put it in two columns: variable= name of the column and value= column value in that combination of subject & activity
   SummarySmartphonesData<-dcast(SummarySmartphonesData,subject + activity ~ variable,mean) #We obtain the mean of all the values of each variable with the same combination of subject & activity
   names(SummarySmartphonesData)[-(1:2)]<-gsub("^","Avg_",names(SummarySmartphonesData)[-(1:2)]) #We add the prefix "Avg_" to indicate that this columns
   #are average data in that activity and subject combination
   SummarySmartphonesData<-arrange(SummarySmartphonesData,subject,activity) #Order data by subject and activity
   SmartphonesData<-arrange(SmartphonesData,subject,activity) #Order data by subject and activity
   
   write.table(SmartphonesData,file="./SmartphonesData.txt",row.names = FALSE) #Output the SmartphonesData table to a .txt file
   write.table(SummarySmartphonesData,file="./SummarySmartphonesData.txt",row.names = FALSE) #Output the SummarySmartphonesData table to a .txt file
   
   View(SmartphonesData) #Show table with variables that contains mean and standard deviation. See codebook for more info.
   View(SummarySmartphonesData) #Show the calculated average for each varible for each subject and activity combination
}