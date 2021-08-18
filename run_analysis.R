## initialize data sets
dftest <- read.table("~/Documents/Programming/R Projects/GACDFP/UCI HAR Dataset/test/X_test.txt")
dftrain <- read.table("~/Documents/Programming/R Projects/GACDFP/UCI HAR Dataset/train/X_train.txt")
dffeatn <- read.table("~/Documents/Programming/R Projects/GACDFP/UCI HAR Dataset/features.txt", colClasses = "character")
dffeatv <- dffeatn$V2
dffeatv <- tolower(dffeatv)
dffeatv <- gsub("\\()","",dffeatv)
dffeatv <- gsub("-","", dffeatv)
names(dftest) <- dffeatv
names(dftrain) <- dffeatv
rm(dffeatn, dffeatv)

##extracts mean and standard deviation for each measurements
m <- grep("mean",names(dftest))
mf <- grep("meanfreq",names(dftest))
a <- grep("angle",names(dftest))
d <- setdiff(m,mf)
colselectmean <- setdiff(d,a)
colselectstd <- grep("std",names(dftest))
dftest <- dftest[,c(colselectmean,colselectstd)]

m <- grep("mean",names(dftrain))
mf <- grep("meanfreq",names(dftrain))
a <- grep("angle",names(dftrain))
d <- setdiff(m,mf)
colselectmean <- setdiff(d,a)
colselectstd <- grep("std",names(dftrain))
dftrain <- dftrain[,c(colselectmean,colselectstd)]
rm(m,mf,a,d,colselectstd,colselectmean)

##gives descriptive labels to each variable
dftestlab <- read.table("~/Documents/Programming/R Projects/GACDFP/UCI HAR Dataset/test/y_test.txt")
dftrainlab <- read.table("~/Documents/Programming/R Projects/GACDFP/UCI HAR Dataset/train/y_train.txt")
names(dftestlab) <- "activitylabel"
names(dftrainlab) <- "activitylabel"
dftest <- cbind(dftest, dftestlab)
dftrain <- cbind(dftrain, dftrainlab)
rm(dftrainlab,dftestlab)

##gives descriptive names for each activity
dftest$activitylabel <- sub("1","walking",dftest$activitylabel)
dftest$activitylabel <- sub("2","walking_upstairs",dftest$activitylabel)
dftest$activitylabel <- sub("3","walking_downstairs",dftest$activitylabel)
dftest$activitylabel <- sub("4","sitting",dftest$activitylabel)
dftest$activitylabel <- sub("5","standing",dftest$activitylabel)
dftest$activitylabel <- sub("6","laying",dftest$activitylabel)

dftrain$activitylabel <- sub("1","walking",dftrain$activitylabel)
dftrain$activitylabel <- sub("2","walking_upstairs",dftrain$activitylabel)
dftrain$activitylabel <- sub("3","walking_downstairs",dftrain$activitylabel)
dftrain$activitylabel <- sub("4","sitting",dftrain$activitylabel)
dftrain$activitylabel <- sub("5","standing",dftrain$activitylabel)
dftrain$activitylabel <- sub("6","laying",dftrain$activitylabel)

dftestsubj <- read.table("~/Documents/Programming/R Projects/GACDFP/UCI HAR Dataset/test/subject_test.txt")
dftrainsubj <- read.table("~/Documents/Programming/R Projects/GACDFP/UCI HAR Dataset/train/subject_train.txt")
names(dftestsubj) <- "subject"
names(dftrainsubj) <- "subject"
dftest <- cbind(dftest, dftestsubj)
dftrain <- cbind(dftrain, dftrainsubj)
rm(dftrainsubj,dftestsubj)

##Merges data sets together
df <- rbind(dftest,dftrain)
rm(dftest,dftrain)

##Creates second data set with average for each variable for each activity and subject 
library(dplyr)

df2 <- df %>% 
        group_by(activitylabel,subject) %>% 
        summarise(across(), mean())
write.table(df2, "./tidydataset.txt", row.names = FALSE)