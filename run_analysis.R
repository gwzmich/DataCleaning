run_analysis <- function()
{        

##  Coursera - Johns Hopkins Data Cleaning Course
##  Prepared by Greg Zmich        
##
##      Project Tasks      
##        
##      1. Merges the training and the test sets to create one data set.
##      2. Extracts only the measurements on the mean and standard deviation for each measurement. 
##      3. Uses descriptive activity names to name the activities in the data set
##      4. Appropriately labels the data set with descriptive variable names. 
##      5. From the data set in step 4, creates a second, independent tidy data set 
##         with the average of each variable for each activity and each subject.
        
        
        
## libraries
        library("dplyr")
        library("tidyr")
        library("stringr")


## tools
        object.list <- objects()


## set directory
        setwd("/Users/zmich/Desktop/Coursera/02 Data Cleaning/")


## load data
        activity.labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
        features <- read.table("./UCI HAR Dataset/features.txt")

        test.subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
        test.x <- read.table("./UCI HAR Dataset/test/X_test.txt")
        test.y <- read.table("./UCI HAR Dataset/test/y_test.txt")

        train.subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
        train.x <- read.table("./UCI HAR Dataset/train/X_train.txt")
        train.y <- read.table("./UCI HAR Dataset/train/y_train.txt")

        body.acc.x.test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
        body.acc.y.test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
        body.acc.z.test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")

        body.gyro.x.test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
        body.gyro.y.test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
        body.gyro.z.test <- read.table("./UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")

        total.acc.x.test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
        total.acc.y.test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
        total.acc.z.test <- read.table("./UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")

        body.acc.x.train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
        body.acc.y.train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
        body.acc.z.train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")

        body.gyro.x.train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
        body.gyro.y.train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
        body.gyro.z.train <- read.table("./UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")

        total.acc.x.train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
        total.acc.y.train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
        total.acc.z.train <- read.table("./UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")


## rename variables for train.x and test.x - fulfills Task 4
        feature.column.names <- features[,2]

        feature.column.names <- tolower(feature.column.names)

        feature.column.names <- gsub("\\()","",feature.column.names)
        feature.column.names <- gsub("-",".",feature.column.names)
        feature.column.names <- gsub("\\(",".",feature.column.names)
        feature.column.names <- gsub("\\)","",feature.column.names)
        feature.column.names <- gsub("\\,",".",feature.column.names)

        colnames(test.x) <- feature.column.names
        colnames(train.x) <- feature.column.names


## add test or train variable

        test.subject <- mutate(test.subject, subject.status = "TEST")
        train.subject <- mutate(train.subject, subject.status = "TRAIN")

        colnames(test.subject) <- c("subject", "subject.status")
        colnames(train.subject) <- c("subject", "subject.status")


## rename activities from numeric to descriptive - fulfills Task 3

        test.y <- inner_join(test.y, activity.labels, by = "V1", sort = FALSE)
        train.y <- inner_join(train.y, activity.labels, by = "V1", sort = FALSE)

        colnames(test.y) <- c("V1", "activity")
        colnames(train.y) <- c("V1", "activity")

        ## delete activity numeric
        test.y$V1 <- NULL
        train.y$V1 <- NULL


## merge data to one data  - fulfills Task 1
        test <- cbind(test.subject, test.y)
        test <- cbind(test, test.x)

        train <- cbind(train.subject, train.y)
        train <- cbind(train, train.x)

        data <- rbind(test, train)


## extract mean and standard deviation variables - completes Task 2
        data.column.names <- colnames(data)

        mean.or.std <- str_detect(data.column.names, "subject") | 
                str_detect(data.column.names, "subject.status") | 
                str_detect(data.column.names, "activity") | 
                str_detect(data.column.names, "mean") | 
                str_detect(data.column.names, "std")

        data2 <- data[mean.or.std]
       

## create summary data set - fullfills Task 5
        data5temp <- group_by(data2, activity, subject)
        data5temp$subject.status <- NULL
        data5 <- summarise_each(data5temp, funs(mean))
        write.table(data5, file = "data5.txt", row.name=FALSE)

        return(data5)

}
