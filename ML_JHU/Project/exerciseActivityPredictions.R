# download the data
setwd("~/Coursera/ML_JHU/Project")
urlTrain <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
urlTest <- "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"
filenameTrain <- "pml_training.csv"
filenameTest <- "pml_testing.csv"
pathTrain <- paste(getwd(), "data", filenameTrain, sep="/")
pathTest <- paste(getwd(), "data", filenameTest, sep="/")

if (!(filenameTrain %in% dir(paste(getwd(), "data", sep="/")))) {
    # download file
    print("downloading training data file...")
    dLoadTrain <- download.file(urlTrain, pathTrain, method="curl", cacheOK=TRUE)
}

if (!(filenameTest %in% dir(paste(getwd(), "data", sep="/")))) {
    # download testing data file
    print("downloading testing data file...")
    dLoadTest <- download.file(urlTest, pathTest, method="curl", cacheOK=TRUE)
}

pmlTraining <- "pml_training.csv"
pmlTesting <- "pml_testing.csv"

# now load data into dataframe
training <- read.csv(paste("data", pmlTraining, sep="/"))
testing <- read.csv(paste("data", pmlTesting, sep="/"))


##### CLEANING #####
##########################
# look at head of training data.  Lots of NA's.  Lets see how many columns have
# all NA's (or perhaps mostly NA's): The only columns that have NA's 
# are ones that deal with descriptive stats like mean, var, std, max, min, etc.
# and each of those columns have exactly 19216 NAs out of 19622 rows.  We will
# remove these columns.
cleanTrain <- training[, colSums(is.na(training)) == 0]

# looking at str(cleanTrain) we can see several factor variables that may
# not serve as good predictors i.e., many have #DIV/0! values, or there may
# simply be factors with many many levels and not much data in each of those
# levels.  Many of the factors describe kurtosis and skewness which are
# probably not as meaningful as the numerical values of say roll, pitch, yaw,
# gyros, and accelerations, etc.  We will remove all of the factor variables
# except for classe which is the variable we're interested in predicting.
cleanTrain <- cbind(cleanTrain[, sapply(cleanTrain, is.numeric)],
                    classe = cleanTrain$classe)

# Now that we have removed the appropriate factor variables, we can see that 
# there are still 4 variables that dont seem useful as predictors. 
# We now remove those:
rmNames <- names(cleanTrain[, 1:4])
rmNames
cleanTrain <- cleanTrain[, !(colnames(cleanTrain) %in% rmNames)]

# We are finished cleaning up the traing data, and now we must ensure that 
# we are using the same variables in the testing set as we are in the 
# training set to ensure consistency.  We do this as follows:
cleanTest <- testing[, colnames(testing) %in% colnames(cleanTrain)]

# notice by running names() on both train and test data that 'classe' is
# no present in the testing set.  Since we are trying to predict 'classe'
# we will take this into consideration by dividing cleanTrain into
# a seperate training and testing set for cross-validation putposes.


##### MODEL BUILDING #####
##########################
# divide cleanTrain into training and testing set
library(caret)

# as it stands now, trying to train a random forest model is taking way
# too long.  We will try to cut down on time by running a feature selection 
# algorithm on the data to pick out only the most important ones.
# The algorithm is the 'Best First' algorithm provided by the 'FSelector'
# package.

#library(FSelector)



#evaluator <- function(subset){
#    # k-fold cross validation
#    k <- 10
#    splits <- runif(nrow(cleanTrain))
#    results = sapply(1:k, function(i){
#        test.idx <- (splits >= (i-1)/k) & (splits < i/k)
#        train.idx <- !test.idx
#        test <- cleanTrain[test.idx, , drop=FALSE]
#        train <- cleanTrain[train.idx, , drop=FALSE]
#        rf <- randomForest(as.simple.formula(subset, "classe"), train, ntree=10)
#        error.rate = sum(test$classe != predict(rf, test, type="c"))/nrow(test)
#        return(1 - error.rate)
#    })
#    print(subset)
#    print(mean(results))
#    return(mean(results))
#}
#
#subset <- best.first.search(names(trainSet)[-53], evaluator)
#f <- as.simple.formula(subset, "classe")
#print(f)


library(doMC)  # for parallel processing
registerDoMC(cores = 4)  # for parallel processing

inTrain <- createDataPartition(y = cleanTrain$classe, p = 0.7, list = FALSE)
trainSet <- cleanTrain[inTrain,]
testSet <- cleanTrain[-inTrain,]

ctrl <- trainControl(method = "cv",
                     number = 10,
                     verboseIter=TRUE,
                     allowParallel=TRUE)
time <- system.time({modRf <- train(classe ~., data=trainSet,
               method = "parRF",
               trControl = ctrl)
})

time[3]/60  # time in minutes
predTr <- predict(modRf, trainSet)  # for in-sample error
predTs <- predict(modRf, testSet)   # for out-of-sample error
confTr <- confusionMatrix(predTr, trainSet$classe) # reports in-sample accuracy
confTs <- confusionMatrix(predTs, testSet$classe) # out-of-sample accuracy



pml_write_files = function(x){
    n = length(x)
    for(i in 1:n){
        filename = paste0("problem_id_",i,".txt")
        write.table(x[i], file=filename,
                    quote=FALSE, row.names=FALSE,
                    col.names=FALSE)
    }
}


answers <- predict(modRf, cleanTest)
answers <- as.character(answers)
pml_write_files(answers)