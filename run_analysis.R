
library(plyr)

#imports feature and activity descriptions
features = read.table('./features.txt',header=FALSE) 
activity = read.table('./activity_labels.txt',header=FALSE)

#assigns column names to features and activity data sets
colnames(features) = c('featureId','featureType')
colnames(activity) = c('activityId','activityType')

# imports Train data set pieces
subjectTrain = read.table('./train/subject_train.txt',header=FALSE)
xTrain = read.table('./train/x_train.txt',header=FALSE)
yTrain = read.table('./train/y_train.txt',header=FALSE)

#assigns column names to Train data set
colnames(subjectTrain) = "subjectId"
colnames(xTrain) = features[,2]
colnames(yTrain) = "activityId"

#creates Train data set
trainData = cbind(yTrain,subjectTrain,xTrain)

# imports Test data set pieces
subjectTest = read.table('./test/subject_test.txt',header=FALSE)
xTest = read.table('./test/x_test.txt',header=FALSE)
yTest = read.table('./test/y_test.txt',header=FALSE)

#assigns column names to Test data set
colnames(subjectTest) = "subjectId"
colnames(xTest) = features[,2]
colnames(yTest) = "activityId"

#creates Test data set
testData = cbind(yTest,subjectTest,xTest)

#combine Train and Test dat sets
masterData = rbind(trainData,testData)

#select only measures of mean and st dev from masterData
submasterData = masterData[,grepl("mean|std|subjectId|activityId", names(masterData))]

#use descriptive activity names
submasterData2 = merge(submasterData, activity)

#label the data with descriptive variable names
names(submasterData2) = gsub('\\(|\\)',"",names(submasterData2), perl = TRUE)
names(submasterData2) = make.names(names(submasterData2))
names(submasterData2) = gsub('Acc',"Acceleration",names(submasterData2))
names(submasterData2) = gsub('Mag',"Magnitude",names(submasterData2))
names(submasterData2) = gsub('^t',"TimeDomain",names(submasterData2))
names(submasterData2) = gsub('^f',"FrequencyDomain",names(submasterData2))
names(submasterData2) = gsub('\\.mean',"Mean",names(submasterData2))
names(submasterData2) = gsub('\\.std',"StandardDeviation",names(submasterData2))
names(submasterData2) = gsub('Freq\\.',"Frequency.",names(submasterData2))
names(submasterData2) = gsub('Freq$',"Frequency",names(submasterData2))

#create the final tidy data set with the average of each variable for each activity and each subject
submasterData3 = ddply(submasterData2, c("subjectId","activityId"), numcolwise(mean))
write.table(submasterData3, file = "tidy.txt", row.name = FALSE)