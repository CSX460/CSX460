---
title: "Improving Model Perfromance / Tuning Parameters"
author: "Your Name"
date: "`r Sys.Date()`"
output: html_document
---


## Tuning Parameter

Generically and regardless of model type, what are the purposes of a model
tuning parameters?

```
```

## Caret Models

This assignment demonstrates the use of caret for constructing models. Each
model should be built and compared using using `Kappa` as the performance
metric calculated using 10-fold repeated cross-validation with 3 folds.

Using the rectangular data that you created for the NYCFlights to create a model
for arr_delay >= 15 minutes.

- glm
- rpart
- knn
- C50
- randomForest
- adaBoost
- Two methods of your choice from the Caret Model List (you will need to install any dependencies)

Save the caret objects with the names provided.

```{r}

# Your work here.

fit.glm <- ..
fit.knn <- ..
fit.rpart <- ..
fit.rf <- ..
fit.myown1 <- ..
fit.myown1 <- ..
```

Compare the  models?

Which is best?  Why?

```
```
