# CSX460 Project Proposal

Team Member(s): John(Yang Zhou)


## Model Objective

* What do you expect to achieve with the model?
It is better to use the model to get a more accurate prediction of a certain person about whether he/she is really a Person who experienced 90 days past due delinquency or worse. And also the model should be functional under a lare amount of noise.

* How will you measure its performance?
I will partition the training model into two part - training and validating, which can use to not only train model but also do validation. 
I'm not planning to use the Test data provided because the data is too large to run on my PC and I can not directly "sample Test data" according to nothing.

## Data Source(s)

* What are the data sources for the model?
The "Give Me Some Credit" Kaggle competition's training data set.

* How will you obtain the data?
The data was downloaded from the Internet.

## Response

* What it the response variables?
SeriousDlqin2yrs:Person experienced 90 days past due delinquency or worse (type: Y/N)

* Are there any surrogate response variables?
No.

## Expected Features

* What are some of the feature you expect to use?
+ RevolvingUtilizationOfUnsecuredLines:Total balance on credit cards and personal lines of credit except real estate and no installment debt like car loans divided by the sum of credit limits
+ age:Age of borrower in years
+ NumberOfTime30-59DaysPastDueNotWorse:Number of times borrower has been 30-59 days past due but no worse in the last 2 years.
+ DebtRatio: Monthly debt payments, alimony,living costs divided by monthy gross income
+ MonthlyIncome:Monthly income
+ NumberOfOpenCreditLinesAndLoans:Number of Open loans (installment like car loan or mortgage) and Lines of credit (e.g. credit cards)
+ NumberOfTimes90DaysLate:Number of times borrower has been 90 days or more past due.
+ NumberRealEstateLoansOrLines: Number of mortgage and real estate loans including home equity lines of credit
+ NumberOfTime60-89DaysPastDueNotWorse:Number of times borrower has been 60-89 days past due but no worse in the last 2 years.
+ NumberOfDependents:Number of dependents in family excluding themselves (spouse, children etc.)

And some combinations of the features mentioned above.


## Models

* What modeling Techniques do you plan on trying?
+ Linear regresion for feature finding
+ Random Forest for model building

* How will you compare the models
Using the TF matrix

## Deployment

* Who will use the model?
People from bank or those who evaluate people's credit rate.

* How will the use it?
By appliying the model on the data they have and see the TF Matrix

## Miscellaneous

* What do you expect to learn from this Project?
How to prepocess data and feature selection as well as model tunning.
