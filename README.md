# CSX460 

This is the repository for *Practical Machine Learning with R* (CSX460) at the University of California, Berkeley. The most recent class is/was `Fall 2016`. 

## Course Description

This course provides an introduction to machine learning using R, the open source, statistical programming language. Once a niche set of tools for statisticians, programmers and quants, machine learning (sometimes also called sttistical learning or data mining) has spread in popularity to become an indispensable tool to a wide variety of applications and disciplines. This course teaches the fundamentals of machine learning without delving into too much mathemtics or code.  The course will teach practical aspects of machine learning. Upon completion of the course students will be able to apply lessons to solve problems using machine learning in their own work.
 

## Course Learning Objectives

Students of this class will learn:

- Fundamental concepts in ML
- The differnece between supervised, unsupervised, semi-supervised, adaptive/reinforcement learning
- The three prerequisites of ML algorithms/models
  - Loss function
  - Restricted class of functions
  - Search methodology for training
- How to evaluate and compare ML model performance
- How to pre-process data and build features
- How to train ML models for prediction, categorization and recommendations
- How to apply ML models on new data
- How to use resampling techniques to calculate model performance
- What the bootstrap is and how it works
- What Bagging is and how and why it improves model performance
- What Boosting is and how and why it improves model performance 
- How to implement/deploy ML models for use by a wider audience
- How to frame questions to be answered using ML techniques
- Collaborate in a group using tools for collaborative/social programming
- Generate high quality, graphical and textual results 



## Intended Audience

- Anyone who wishes to learn the fundamentals of machine learning 
- Anyone who wants to learn about using R to build, evaluate or deploy machine learning models.
- Scientists, engineers, business analysts, research who explore and analyze data and wish to present their findings in well-formatted textual and graphical forms.
- Anyone wishing to get hands-on experience building machine learning models.


## Prerequisites

- Experience programming in at least one high-level programming language such as BASIC, PASCAL, C, Java, Python, Perl, or Ruby. 
- Familiarity with R such as that gained through the Programming with R course.
- Basic knowledge of statistics as covered in a first-semester undergraduate statistics course. There will be some coverage of basic statistical techniques as part of covering core elements of the Machine Learning.
- Personal laptop for class assignments.


## Text/Required Reading

Text for the Course:

    ***Machine Learning with R, 2nd Edition***
    ISBN: 978-1-78439-390-8
    Lantz, Brett
    Packt Publishing 
    2015
     
Recommended:

    ***Applied Predictive Modeling***
    ISBN-13: 978-1461468486
    ISBN-10: 1461468485
    Kuhn, Max and Johnson, Kjell
    Springer Science+Business
    2013
    

## Assignments 

All assignments are due the day before the next lecture.


## Google Group

There is an google group for this class: [CSX460](https://groups.google.com/forum/#!forum/csx460).  Contact the professor for entrance to the group.


## Class Syllabus 

Current Term: Fall 2016

This provides a session by session overview of CS-X460 (Practical Machine Learning).  

### 1. Introduction to R, setting up the ML developers environment

Topics: 
 - Welcome and Introductions
 - Class Book, Materials, etc.
 - Course Overview
 - Setting up your environment
   - Installing R/R Studio
   - Installing git and using Github
 - Installing packages from CRAN and Github  
 - Introduction to Maching Learning 


Reading:
 - **Machine Learning with R (MLR)**, Chapters 1-2
  

### 2. Fundamentals of Machine Learning / Regrssion

 - Data processing 
 - Building First Models
 - Supervised, unsupervised, and semi-supervised 
 - Regression and classification
 - Measuring model error(s)
 - Machine learning prerequisites
 - Algorithm types 

Reading:

 - **MLR** Chapter 3, Chapter 6 pp.171-200
 - [Introduction to dplyr](https://cran.r-project.org/web/packages/dplyr/vignettes/introduction.html)
 - [Introduction to data.table](https://cran.r-project.org/web/packages/data.table/vignettes/datatable-intro.pdf)
 - [Introducting magrittr](https://cran.r-project.org/web/packages/magrittr/vignettes/magrittr.html)

Exercise(s):
  02-fundamentals/02-exercise-nycflights.Rmd


R Packages Introduced:
 - General awesomeness: magrittr
 - Data Manipulation: dplyr, data.table
 - Reading data: readr, data.table::fread



### 3. Linear Regression  

Topics:
 - Linear Regression
 - Model Formula
 - Modeling Process

Reading:
 - [Introduction to R Graphics with *ggplot2*](http://tutorials.iq.harvard.edu/R/Rgraphics/Rgraphics.htm)
 - ?formula
 - ?MASS::stepAIC
 - Suggested: 
   - broom
     - [Introduction to broom](https://cran.r-project.org/web/packages/broom/vignettes/broom.html)
     - [broom+dplyr](https://cran.r-project.org/web/packages/broom/vignettes/broom_and_dplyr.html) 	
 

Exercise(s):
 - 03-linear-regression/

R Packages Introduced:
 - [ggplot2](https://cran.r-project.org/package=ggplot2)
 - [broom](https://cran.r-project.org/package=broom)
 - [MASS::stepAIC](https://cran.r-project.org/package=MASS)


### 4. Introduction to classification / binary classification / logistic regression

Reading:
 - [Introduction to Statistical Learning, Classification 4.1-4.3 "Logistic Regression"](http://www-bcf.usc.edu/~gareth/ISL/)
 - **MLwR** Chapter 10
 - Suggested: 
   - [AIC:Akaike Information Criterion](https://en.wikipedia.org/wiki/Akaike_information_criterion)

Exercise(s):
 - 03-exercise-nyc-flights-logistic.Rmd

R Packages Introduced:
 - stats::glm
 - MASS::stepAIC
 

### 5. Classification Metrics and Resampling

Reading:
 - **MLwR** Chapter 5
 
Exercise(s):
 - classification-metrics-exercises.Rmd
 
R Packages Introduced:
 - caret
 - gmodels
 - ROCR, pROC
 

### 6. Recursive Partitioning / Bias-Variance Trade-off

 - Decision Trees/Recursive Partitioning
 - Bias-Variance Trade-off
 - Introduction to Caret

Reading:

 - **MLwR** Chapter 11 Improving Model Performance (First Part) 
   - Tuning Stock Models (pp. 347-358)
 - Review [Caret Website](https://topepo.github.io/caret/) 
   There is a lot in the caret website, it is most important to familiarize yourself with the use of the models.

Exercise(s):
 - None. 

R Packges introduced:
 - caret
 - rpart
 - ctree
 - C50


### 7. Improving Model Performance 
 - Bagging
   - Bagged Trees / Random Forests 
 - Boosting


Exercises:  
 -  exercise-caret-models.Rmd (Due: 2016-12-06)

Reading:
 - **MLwR** Chapter 11 Improving Model Performance (Second Part) 
   - Tuning Stock Models (pp. 359-376)



R Packages introduced:
 - caret


### 8.	Time Series

Reading:

- [CRAN Task View: **Time Series Analysis**](https://cran.r-project.org/web/views/TimeSeries.html)
- [**Forecasting Principals and Practice**](https://www.otexts.org/fpp) 
  - Chapters 1 "Getting Started"
  - Chapter 2 "The Forecaster's Toolbox"
  - Chapter 3 "Judgemental Forecasts"
  - Chapter 8 "Arima Models"


Exercise(s):
- Complete control-lift in-class exercise
- Complete revenue forecast exercise 


R Packages Introduced:
 - survival : survReg
 - forecast : Arima



### 9.	Deployment 

Topics:
- Delivery and Production
- Patterns


Reading:


Exercise(s):
 - None

### 10. Special Topics

