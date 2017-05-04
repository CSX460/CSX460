# CSX460 

This is the repository for *Practical Machine Learning with R* (CSX460) at the University of California, Berkeley. The most recent class is/was `Spring 2017`. 

## Course Description

This course provides an introduction to machine learning using R, the open source, statistical programming language. Once a niche set of tools for statisticians, programmers and quants, machine learning (sometimes also called statistical learning or data mining) has spread in popularity to become an indispensable tool to a wide variety of applications and disciplines. This course teaches the fundamentals of machine learning without delving into too much mathematics or code.  The course will teach practical aspects of machine learning. Upon completion of the course students will be able to apply lessons to solve problems using machine learning in their own work.
 

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

    ***Applied Predictive Modeling***
    ISBN-13: 978-1461468486
    ISBN-10: 1461468485
    Kuhn, Max and Johnson, Kjell
    Springer Science+Business
    2013
    
     
Supplementary:

    ***Machine Learning with R, 2nd Edition***
    ISBN: 978-1-78439-390-8
    Lantz, Brett
    Packt Publishing 
    2015


## Assignments 

All assignments are due midnight the day before the lecture.


## Google Group

There is an google group for this class: [CSX460](https://groups.google.com/forum/#!forum/csx460).  Contact the professor for entrance to the group.


## Class Syllabus 

Current Term: Spring 2017

This provides a session by session overview of CSX460 (Practical Machine Learning).  


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
 - **APM**, Chapters 1-2
  
Supplementary Reading (Optional): 
 - **Machine Learning with R (MLR)**, Chapters 1-2
  
Exercise(s):
 - R Warmups


### 2. Machine Learning Fundamentals

Topics:
 - Supervised, unsupervised, and semi-supervised 
 - Regression and classification
 - Measuring model error(s)
 - Machine learning prerequisites
 - Algorithm types 
 - First Models

Reading: 
 - [Introduction to dplyr](https://cran.r-project.org/web/packages/dplyr/vignettes/introduction.html)
 - [Introduction to data.table](https://cran.r-project.org/web/packages/data.table/vignettes/datatable-intro.pdf)
 - **APM**, Chapter 3
 
Supplementary Reading (Optional): 
 - **MLR** Chapter 3
 - [Introducting magrittr](https://cran.r-project.org/web/packages/magrittr/vignettes/magrittr.html)
 
Exercise(s):
 - NYC FLights (Data Munging) 

R Packages Introduced:
 - [magrittr](https://cran.r-project.org/package=magrittr)
 - Data Manipulation
   - [dplyr](https://cran.r-project.org/package=dplr)
 - [data.table](https://cran.r-project.org/package=data.table)
 - Reading data: 
   - [readr](https://cran.r-project.org/package=readr)
   - [data.table::fread](https://cran.r-project.org/package=data.table)


### 3. Linear Regression  

Topics:
 - Modeling Process Revisited
 - Data Pre-processing
 - Linear Regression
 - Model Formula
   - Spline Fitting
 - Modeling Process
 - Naive Model

Reading:
 - **APM** Chapter 6.1 - 6.3, 6.5  
 - [Introduction to R Graphics with *ggplot2*](http://tutorials.iq.harvard.edu/R/Rgraphics/Rgraphics.htm)
 - ?formula
 - ?MASS::stepAIC

Supplementary Reading (Optional): 
 - **MLwR**, Chapter 6 pp.171-200
 - [ProjectTemplate](https://cran.r-project.org/package=ProjectTemplate 
 - [devtools](https://cran.r-project.org/package=devtools)
 

Exercise(s):
 - Model Arrival Delay from previous data 

R Packages Introduced:
 - [ggplot2](https://cran.r-project.org/package=ggplot2)
 - [ProjectTemplate](https://cran.r-project.org/package=ProjectTemplate)
 - [devtools](https://cran.r-project.org/package=devtools)
 - [MASS::stepAIC](https://cran.r-project.org/package=MASS)


### 4. Introduction to classification / binary classification / logistic regression

Reading:
 - **APM** Chapter 12.1 - 12.2 
 - [Introduction to Statistical Learning, Classification 4.1-4.3 "Logistic Regression"](http://www-bcf.usc.edu/~gareth/ISL/)
 

Supplementary Reading (Optional): 
 - **MLwR** Chapter 10
 - [AIC:Akaike Information Criterion](https://en.wikipedia.org/wiki/Akaike_information_criterion)

Exercise(s):
 - NYC Flights Logicstic Regression

R Packages Introduced:
 - stats::glm
 - MASS::stepAIC
 

### 5. Classification Metrics and Resampling

Topics: 
* Classification Metrics
* Resampling

Reading:
 - **APM** Chapter 4.1 - 4.4 "Over Fitting and Model Tuning"
 - **APM** Chapter 5 "Measuring Performance in Regression Models" (~6 pages)
 - **APM** Chapter 11 "Measuring Performance in Classification Models" (~20 pages)
 
Supplementary Reading (Optional): 
 - **MLwR** Chapter 3-4 


Exercise(s):
 - classification-metrics
 - resampling
 
R Packages Introduced:
 - caret
 - gmodels
 - ROCR, pROC
 

### 6. Recursive Partitioning / Bias-Variance Trade-off

Topics:
 - Decision Trees/Recursive Partitioning
 - Bias-Variance Trade-off
 - Introduction to Caret


Reading:
 - **APM** TBD 
 - **APM** Chapter 5 "Measuring Performance in Regression Models" (esp. 5.2 "The Variance Bias Trade-Off") (5 pages)

 - [Caret Website](https://topepo.github.io/caret/) 
   There is a lot in the caret website, it is most important to familiarize yourself with the use of the models.


Supplementary Reading (Optional): 
 - **MLwR** Chapter 5 "Divide and Conquer - Classification Using Decision Trees and Rules"
 - **MLwR** Chapter 11 "Improving Model Performance" (First Part) 
   - Tuning Stock Models (pp. 347-358)

Exercise(s):
 - TBD 

R Packges introduced:
 - caret 
 - rpart
 - ctree
 - C50


### 7. Improving Model Performance 

Topics:
 - Bagging
   - Bagged Trees / Random Forests 
 - Boosting

Reading: 
 - **APM** TBD 

Supplementary Reading (Optional): 
 - **MLwR** Chapter 11 Improving Model Performance (Second Part) 
   - Tuning Stock Models (pp. 359-376)

Exercises:  
 -  exercise-caret-models.Rmd 

R Packages introduced:
 - caret (cont)


### 8.	Time Series Modeling

Topics: 
 - Survival Models
 - Time Series Models 
 - Forecast Window Models
 
 
Reading:
- [**Forecasting Principals and Practice**](https://www.otexts.org/fpp) 
  - Chapters 1 "Getting Started"
  - Chapter 2 "The Forecaster's Toolbox"
  - Chapter 6 "Time Series Decomposition"

Exercise(s):


### 9.	Deployment 

Topics:
- Delivery and Production
- Patterns

Reading:
 - TBD 
 
Supplementary Reading (Optional): 
 - TBD 
 
Exercise(s):
 - TBD

R Packages Introduced: 
 - devtools


### 10. Special Topics

Topics:

Reading:

Supplementary Reading (Optional): 

