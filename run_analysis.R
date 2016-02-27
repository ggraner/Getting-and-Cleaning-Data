library(data.table)
library(dplyr)

run_analysis<-function() {
        
        ### SECTION 1 - DOWNLOADING DATA ###
        
        # create data subfolder if not exists
        if(!file.exists("./data")) {dir.create("./data")}
        # project data
        fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        if(!file.exists("./data/Dataset.zip")) {
                cat("downloading datasets...\n")
                download.file(fileUrl, destfile="./data/Dataset.zip", method="curl")
                cat("extracting datasets...\n")
                unzip("./data/Dataset.zip", exdir="./data")
        }
        data_path<-file.path("./data", "UCI HAR Dataset")
        
        ### SECTION 2 - READING FILES INTO DATA TABLES ###
        
        cat("reading datasets...\n")
        # reading List of all Features
        data_feature_names<-read.table(file.path(data_path, "features.txt"), head=FALSE)
        # reading class with labels with their activity name
        data_activity_labels<-read.table(file.path(data_path, "activity_labels.txt"), head=FALSE)
        # reading activity files
        data_activity_test<-read.table(file.path(data_path, "test", "y_test.txt"), head=FALSE)
        data_activity_train<-read.table(file.path(data_path, "train", "y_train.txt"), head=FALSE)
        # reading feature files
        data_features_test<-read.table(file.path(data_path, "test", "X_test.txt"), head=FALSE)
        data_features_train<-read.table(file.path(data_path, "train", "X_train.txt"), head=FALSE)
        # reading subject files
        data_subject_test<-read.table(file.path(data_path, "test", "subject_test.txt"), head=FALSE)
        data_subject_train<-read.table(file.path(data_path, "train", "subject_train.txt"), head=FALSE)
        
        ### SECTION 3 - MERGE TEST & TRAINING SET TO ONE TABLE ###
        
        # merge data subject
        data_subject<-rbind(data_subject_train, data_subject_test)
        # merge data activity
        data_activity<-rbind(data_activity_train, data_activity_test)
        # merge data features
        data_features<-rbind(data_features_train, data_features_test)
        # set variable names
        names(data_subject)<-c("subject")
        names(data_activity)<-c("activity")
        names(data_features)<-data_feature_names$V2
        # add id to datasets
        data_subject$id<-seq.int(nrow(data_subject))
        data_activity$id<-seq.int(nrow(data_activity))
        data_features_id<-seq.int(nrow(data_features))
        # rearrange columns, setting *$id as first column
        data_subject<-data_subject[c("id", "subject")]
        data_activity<-data_activity[c("id", "activity")]
        data_features<-cbind(data_features_id, data_features)
        # rename 1 column of data_features
        names(data_features)[1]<-"id"
        # merge for all data in one data frame using inner_join from dplyr package
        cat("merging datasets...\n")
        data<-inner_join(data_subject, data_activity, by="id") %>% inner_join(data_features, by="id")
        
        ### SECTION 4 - PREPARE MERGED TABLE FOR TIDY OUTPUT ###
        
        #remove duplicated column names
        data<-data[, !duplicated(colnames(data))]
        # extracts only the measurements on the mean and standard deviation column for each measurement
        data<-select(data, id, subject, activity, matches("mean\\(\\)|std\\(\\)"))
        #replace acitivity numbers with label names 
        data$activity<-data_activity_labels[data$activity, 2]
        #create appropriately labels for the data set with descriptive variable names
        colnames(data)<-tolower(colnames(data))
        names(data)<-gsub("([-])", "_", names(data))
        names(data)<-gsub("([()])", "", names(data))
        names(data)<-gsub("^t", "time_", names(data))
        names(data)<-gsub("^f", "freq_", names(data))
        names(data)<-gsub("body", "body_", names(data))
        names(data)<-gsub("body_body_", "body_", names(data))
        names(data)<-gsub("gravity", "gravity_", names(data))
        #delete merge id
        data$id<-NULL
        #create average of each variable for each activity and each subject.
        data_tidy<-aggregate(. ~subject + activity, data, mean)
        #order by subject & activity
        data_tidy<-data_tidy[order(data_tidy$subject,data_tidy$activity),]
        #add id after sorting
        data_tidy<-cbind(seq.int(nrow(data_tidy)), data_tidy)
        names(data_tidy)[1]<-"id"
        
        ### SECTION 5 - WRITE TIDY DATA TO NEW FILE ###
        
        cat("writing tidy dataset to run_analysis_tidy.csv\n")
        write.table(data_tidy, file="run_analysis_tidy.csv", sep=",",row.names=FALSE)

}