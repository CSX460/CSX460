# 05-exercises
Octavio Suarez Munist  
2016-05-xx  

## Reading:
- **APM** Chapter 8.1-8.5 "Regression Trees and Rule-Based Models" (25 pages)
- **APM** Chapter 14.1-14.5 "Classification Trees and Rule-Based"  


```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```
## Loading required package: lattice
```

```
## Type 'citation("pROC")' for a citation.
```

```
## 
## Attaching package: 'pROC'
```

```
## The following objects are masked from 'package:stats':
## 
##     cov, smooth, var
```


## Exercise 1: GermanCredit

Revisit the GermanCredit data. Use `caret` to build models of `Class` using the following techniques:

- glm
- rpart
- knn
- party::ctree
- randomForest
- A method of your choice from the Caret Model List (you will need to install any dependencies)

Save the caret objects with the names provided.


```r
# Your work here. 

data(GermanCredit)
gc <- GermanCredit

ctrl <- trainControl( method="boot", number=5, classProb=TRUE, savePrediction=TRUE )

fit.glm <- train(Class ~ Amount, data=gc, method="glm", family="binomial", trControl=ctrl)
fit.knn <- train(Class ~ Amount, data=gc, method="knn", tuneGrid=data.frame( k=c(40,50,60)))
fit.rpart <- train(Class ~ Amount, data=gc, method="rpart",trControl=ctrl, tuneLength=20)
```

```
## Loading required package: rpart
```

```r
fit.rf <- train(Class ~ Amount, data=gc, method="rf",trControl=ctrl)
```

```
## Loading required package: randomForest
```

```
## Warning: package 'randomForest' was built under R version 3.2.5
```

```
## randomForest 4.6-12
```

```
## Type rfNews() to see new features/changes/bug fixes.
```

```
## 
## Attaching package: 'randomForest'
```

```
## The following object is masked from 'package:dplyr':
## 
##     combine
```

```
## The following object is masked from 'package:ggplot2':
## 
##     margin
```

```
## Warning in randomForest.default(x, y, mtry = param$mtry, ...): invalid
## mtry: reset to within valid range
```

```
## Warning in randomForest.default(x, y, mtry = param$mtry, ...): invalid
## mtry: reset to within valid range

## Warning in randomForest.default(x, y, mtry = param$mtry, ...): invalid
## mtry: reset to within valid range

## Warning in randomForest.default(x, y, mtry = param$mtry, ...): invalid
## mtry: reset to within valid range

## Warning in randomForest.default(x, y, mtry = param$mtry, ...): invalid
## mtry: reset to within valid range

## Warning in randomForest.default(x, y, mtry = param$mtry, ...): invalid
## mtry: reset to within valid range
```

```r
fit.myown <- train(Class ~ Amount, data=gc, method="bayesglm",trControl=ctrl)
```

```
## Loading required package: arm
```

```
## Warning: package 'arm' was built under R version 3.2.5
```

```
## Loading required package: MASS
```

```
## 
## Attaching package: 'MASS'
```

```
## The following object is masked from 'package:dplyr':
## 
##     select
```

```
## Loading required package: Matrix
```

```
## Loading required package: lme4
```

```
## 
## arm (Version 1.8-6, built: 2015-7-7)
```

```
## Working directory is C:/Users/OMunist/Desktop/CSX460/CSX460osm/05-decision-trees
```


- Compare the models using `caret::confusionMatrix`
- Comparing the models Using the `pROC` packages
  - create ROC curves for the models 
  
Show your work! 

NOTE: Not sure why KNN is failing; removing from analysis for now.


```r
table(fit.glm$pred$pred, fit.glm$pred$obs) %>% confusionMatrix()
```

```
## Confusion Matrix and Statistics
## 
##       
##         Bad Good
##   Bad    37   21
##   Good  479 1249
##                                           
##                Accuracy : 0.72            
##                  95% CI : (0.6986, 0.7408)
##     No Information Rate : 0.7111          
##     P-Value [Acc > NIR] : 0.2096          
##                                           
##                   Kappa : 0.0749          
##  Mcnemar's Test P-Value : <2e-16          
##                                           
##             Sensitivity : 0.07171         
##             Specificity : 0.98346         
##          Pos Pred Value : 0.63793         
##          Neg Pred Value : 0.72280         
##              Prevalence : 0.28891         
##          Detection Rate : 0.02072         
##    Detection Prevalence : 0.03247         
##       Balanced Accuracy : 0.52758         
##                                           
##        'Positive' Class : Bad             
## 
```

```r
#table(fit.knn$pred$pred, fit.knn$pred$obs) %>% confusionMatrix()
table(fit.rpart$pred$pred, fit.rpart$pred$obs) %>% confusionMatrix()
```

```
## Confusion Matrix and Statistics
## 
##       
##          Bad  Good
##   Bad   1187  2296
##   Good  9333 23664
##                                          
##                Accuracy : 0.6812         
##                  95% CI : (0.6764, 0.686)
##     No Information Rate : 0.7116         
##     P-Value [Acc > NIR] : 1              
##                                          
##                   Kappa : 0.0304         
##  Mcnemar's Test P-Value : <2e-16         
##                                          
##             Sensitivity : 0.11283        
##             Specificity : 0.91156        
##          Pos Pred Value : 0.34080        
##          Neg Pred Value : 0.71716        
##              Prevalence : 0.28838        
##          Detection Rate : 0.03254        
##    Detection Prevalence : 0.09548        
##       Balanced Accuracy : 0.51219        
##                                          
##        'Positive' Class : Bad            
## 
```

```r
table(fit.rf$pred$pred, fit.rf$pred$obs) %>% confusionMatrix()
```

```
## Confusion Matrix and Statistics
## 
##       
##        Bad Good
##   Bad  191  384
##   Good 376  915
##                                         
##                Accuracy : 0.5927        
##                  95% CI : (0.57, 0.6151)
##     No Information Rate : 0.6961        
##     P-Value [Acc > NIR] : 1.0000        
##                                         
##                   Kappa : 0.0411        
##  Mcnemar's Test P-Value : 0.7996        
##                                         
##             Sensitivity : 0.3369        
##             Specificity : 0.7044        
##          Pos Pred Value : 0.3322        
##          Neg Pred Value : 0.7088        
##              Prevalence : 0.3039        
##          Detection Rate : 0.1024        
##    Detection Prevalence : 0.3081        
##       Balanced Accuracy : 0.5206        
##                                         
##        'Positive' Class : Bad           
## 
```

```r
table(fit.myown$pred$pred, fit.myown$pred$obs) %>% confusionMatrix()
```

```
## Confusion Matrix and Statistics
## 
##       
##         Bad Good
##   Bad    32   21
##   Good  494 1289
##                                         
##                Accuracy : 0.7195        
##                  95% CI : (0.6983, 0.74)
##     No Information Rate : 0.7135        
##     P-Value [Acc > NIR] : 0.2948        
##                                         
##                   Kappa : 0.0613        
##  Mcnemar's Test P-Value : <2e-16        
##                                         
##             Sensitivity : 0.06084       
##             Specificity : 0.98397       
##          Pos Pred Value : 0.60377       
##          Neg Pred Value : 0.72294       
##              Prevalence : 0.28649       
##          Detection Rate : 0.01743       
##    Detection Prevalence : 0.02887       
##       Balanced Accuracy : 0.52240       
##                                         
##        'Positive' Class : Bad           
## 
```

```r
roc(fit.glm$pred$obs, fit.glm$pred$Bad, auc=TRUE )  %>% plot( print.auc=TRUE, grid=TRUE)
```

![](05-exercises_files/figure-html/unnamed-chunk-3-1.png)

```
## 
## Call:
## roc.default(response = fit.glm$pred$obs, predictor = fit.glm$pred$Bad,     auc = TRUE)
## 
## Data: fit.glm$pred$Bad in 516 controls (fit.glm$pred$obs Bad) > 1270 cases (fit.glm$pred$obs Good).
## Area under the curve: 0.5542
```

```r
#roc(fit.knn$pred$obs, fit.knn$pred$Bad, auc=TRUE )  %>% plot( print.auc=TRUE, grid=TRUE)
roc(fit.rpart$pred$obs, fit.rpart$pred$Bad, auc=TRUE )  %>% plot( print.auc=TRUE, grid=TRUE)
```

![](05-exercises_files/figure-html/unnamed-chunk-3-2.png)

```
## 
## Call:
## roc.default(response = fit.rpart$pred$obs, predictor = fit.rpart$pred$Bad,     auc = TRUE)
## 
## Data: fit.rpart$pred$Bad in 10520 controls (fit.rpart$pred$obs Bad) < 25960 cases (fit.rpart$pred$obs Good).
## Area under the curve: 0.4698
```

```r
roc(fit.rf$pred$obs, fit.rf$pred$Bad, auc=TRUE )  %>% plot( print.auc=TRUE, grid=TRUE)
```

![](05-exercises_files/figure-html/unnamed-chunk-3-3.png)

```
## 
## Call:
## roc.default(response = fit.rf$pred$obs, predictor = fit.rf$pred$Bad,     auc = TRUE)
## 
## Data: fit.rf$pred$Bad in 567 controls (fit.rf$pred$obs Bad) > 1299 cases (fit.rf$pred$obs Good).
## Area under the curve: 0.5224
```

```r
roc(fit.myown$pred$obs, fit.myown$pred$Bad, auc=TRUE )  %>% plot( print.auc=TRUE, grid=TRUE)
```

![](05-exercises_files/figure-html/unnamed-chunk-3-4.png)

```
## 
## Call:
## roc.default(response = fit.myown$pred$obs, predictor = fit.myown$pred$Bad,     auc = TRUE)
## 
## Data: fit.myown$pred$Bad in 526 controls (fit.myown$pred$obs Bad) > 1310 cases (fit.myown$pred$obs Good).
## Area under the curve: 0.5438
```


Q: Which models would you select based on these tools?

A: base on AUC, GLM is the best, with also the second-best Accuracy, but sensitivity is the worse of a bad lot. 

Q: If you assume that a `Class=="bad""` is 10 more costly than `Class=="good"`, determine your threshold for the model of your choice.  

A: First thought would be to lower threshold by a factor of 10, to 0.05. But maybe adjust for proportion of bad.



