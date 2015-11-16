---
title: "Give me some credit"
author: "John (Yang Zhou)"
date: "November 8th 2015"
output: html_document
---

CSX460 Final Project
========================================
##Project Introduction
This project use the data set from kaggle competition: Give Me Some Credit, and intend to hence a convincable result by applying machine learning techniques such as Random Forest and Linear regression.

##main challenge
* Preprocess:
+ Unable to handle large training data set on personal computer
+ Find a efficient way to unbised sampling data 
+ Find best way to deal with missing values
* Feature selection and construction
+ Number of variables is comparatively small due to the unsensitivity to variable dimensions of Random Forest algorithm, which make feature selection as well as feature construction crutial in this project
* Model Tuning
+ Number of trees
+ Number of variables randomly sampled as candidates at each split
+ Number of features

Part One: Data preprocessing
=====================================
###Getting started
```{r}
library(caret)
library(party)
library(ggplot2)
library(magrittr)
library(pROC)
set.seed(314159)

setwd("D:/学习资料/UCB上/Practical of machine learning in R/CSX460/PROJECT")

train_data <- read.csv("cs-training.csv")

#remove the row name column
train_data <- train_data[,-1]
```

### double sampling data due to large data set (unbiased)

```{r}
#choose good and bad seperately
bad <- train_data[which(train_data$SeriousDlqin2yrs==1),]

good <- train_data[-which(train_data$SeriousDlqin2yrs==1),]

#take equal numbers of data from both good and bad(randomly and unbiased)
bad_sample_nrow <- sort(sample(nrow(bad),size=1000))

bad_sample <- bad[c(bad_sample_nrow),]

good_sample_nrow <- sample(nrow(good),size=1000)

good_sample <- good[c(good_sample_nrow),]

#conbine the two set of good and bad data
onepercent_sample_train_data <- rbind(bad_sample, good_sample)


#partition training data into train and valid
sample_train_data_nrow <- sort(sample(nrow(train_data), size=nrow(train_data)*0.7))

sample_train_data <- train_data[c(sample_train_data_nrow),]

sample_valid_data <- train_data[-c(sample_train_data_nrow),]

#copy data set for linear regression
linear_train_data <- onepercent_sample_train_data

#transform the target column into factor in order to make random forest work
onepercent_sample_train_data$SeriousDlqin2yrs <- as.factor(onepercent_sample_train_data$SeriousDlqin2yrs)
```

### Remove Redundant Features

```{r}
# calculate correlation matrix
correlationMatrix <- cor(train_data[,2:11])

# summarize the correlation matrix(show the interconnecttion or influence between each variables)
print(correlationMatrix)

# find attributes that are highly correlated (ideally >0.75)
highlyCorrelated <- findCorrelation(correlationMatrix, cutoff=0.75)

```


```{r echo=FALSE}
# print indexes of highly correlated attributes
print(highlyCorrelated)
```

```{r}
#remove the high coreelated attributes 
onepercent_sample_train_data <- onepercent_sample_train_data[,-highlyCorrelated]

```

### rank feature importance

```{r}
# prepare training scheme
control <- trainControl(method="repeatedcv", number=10, repeats=3)

# train the model
model <- train(SeriousDlqin2yrs~., data=onepercent_sample_train_data, method="lvq", preProcess="scale", trControl=control)

# estimate variable importance
importance <- varImp(model, scale=FALSE)
```

```{r echo=FALSE}
# summarize importance
print(importance)
```

```{r echo=FALSE}
# plot importance
plot(importance)
```

### preprocessing by deal with missing value and feature selection
```{r}
#Replacing Missing Values with column mean
for(i in 2:ncol(onepercent_sample_train_data)){
  onepercent_sample_train_data[is.na(onepercent_sample_train_data[,i]), i] <- mean(onepercent_sample_train_data[,i], na.rm = TRUE)
}

# define the control using a random forest selection function for cross validation feature selection
control <- rfeControl(functions=rfFuncs, method="cv", number=5)

# run the RFE algorithm 
results <- rfe(x=onepercent_sample_train_data[,2:9], y=onepercent_sample_train_data[,1], sizes=c(2:9), rfeControl=control)
```

```{r echo=FALSE}
# summarize the results
print(results)
```

```{r echo=FALSE}
# list the chosen features
predictors(results)
```

```{r echo=FALSE}
# plot the results
plot(results, type=c("g", "o"))
```

#### From the plot, we can see that when taking 7 number of features in the model building, the random forest can give the better prediction.

Part Two: Random Forest Model Building
=====================================
* linear regression: finding feature conbinations

```{r}
for(i in 1:ncol(linear_train_data)){
  linear_train_data[is.na(linear_train_data[,i]), i] <- mean(linear_train_data[,i], na.rm = TRUE)
}

# transform data
linear_train_data$SeriousDlqin2yrs <- (linear_train_data$SeriousDlqin2yrs - 1) %>% as.logical 

#cross validation
linear_model1 <- glm( SeriousDlqin2yrs ~ . , data=linear_train_data, family="binomial")
linear_model2 <- glm( SeriousDlqin2yrs ~ (.)^2, data=linear_train_data,  family="binomial")
```

```{r echo=FALSE}
#feature conbination identified
summary(linear_model1)
summary(linear_model2)
```

* Model Training
+ Using features generated from previous steps (***Feature selecttion*** & ***linear regretion***)
+ Use mtry(Number of variables randomly sampled as candidates at each split) as default 1
+ Number of Trees: 100

```{r}
#only use the features that are seleceted
sample_train_data$SeriousDlqin2yrs <- as.factor(sample_train_data$SeriousDlqin2yrs)

#Replacing Missing Values with column mean
for(i in 2:ncol(sample_train_data)){
  sample_train_data[is.na(sample_train_data[,i]), i] <- mean(sample_train_data[,i], na.rm = TRUE)
}
#random forest model training 

rf_model <- randomForest(SeriousDlqin2yrs ~ NumberOfTime60.89DaysPastDueNotWorse
                    +RevolvingUtilizationOfUnsecuredLines
                    +NumberOfTime30.59DaysPastDueNotWorse
                    +NumberOfTimes90DaysLate
                    +RevolvingUtilizationOfUnsecuredLines
                    +age
                    +RevolvingUtilizationOfUnsecuredLines*DebtRatio
                    +RevolvingUtilizationOfUnsecuredLines*NumberOfDependents
                    +RevolvingUtilizationOfUnsecuredLines*age
                    +NumberOfTime30.59DaysPastDueNotWorse*NumberOfTime60.89DaysPastDueNotWorse
                    +NumberOfTime30.59DaysPastDueNotWorse*NumberOfTime30.59DaysPastDueNotWorse
                    +NumberOfOpenCreditLinesAndLoans*NumberRealEstateLoansOrLines
                    +NumberOfTimes90DaysLate*NumberOfTime60.89DaysPastDueNotWorse, data=sample_train_data, importance=TRUE, ntree=100)
```

```{r echo=TRUE}
varImpPlot(rf_model)
```


```{r}
#model outcome Validation
sample_valid_data$rf_model <-  
  predict(rf_model, sample_valid_data, type="response") # > 0.5 

# transform data
sample_valid_data$SeriousDlqin2yrs <- (sample_valid_data$SeriousDlqin2yrs - 1) %>% as.logical 

#Plot
qplot( x=rf_model, data=sample_valid_data, fill=SeriousDlqin2yrs )

#TF Matrix
sample_valid_data$rf_model.class <-  
  as.numeric(predict(rf_model, sample_valid_data, type="response"))-1 > 0.5 
```


> From the plot,we can see that the possibility of this model detecting the True Negative is comparative low due low small number of training sample.

```{r echo=FALSE}
( tab.1 <- table( sample_valid_data$SeriousDlqin2yrs, sample_valid_data$rf_model.class ) )
```

```{r echo=FALSE}
#calculate error rate
attach(sample_valid_data)
tab <- tab.1
```

```{r echo=TRUE}
#accuracy
( accuracy = sum(diag(tab))/sum(tab) )
```


```{r echo=TRUE}
#error rate
1- accuracy
```

