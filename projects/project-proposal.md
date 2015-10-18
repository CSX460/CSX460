# CSX460 Project Proposal

Team Member(s):


## Model Objective

* What do you expect to achieve with the model?
To better analyze how good the product categorization, if the new data comes before importing to database, how good the data is ready to go.

* How will you measure its performance?
Accuracy : from the out put True/False
Lift : if possible

## Data Source(s)

* What are the data sources for the model?
Raw data for product, i.e. title, description, brand, category ...

* How will you obtain the data?
Retrieve from S3 server of my company

## Response

* What it the response variables?
True/False

* Are there any surrogate response variables?
Yes, depending on the TF-IDF

## Expected Features

* What are some of the feature you expect to use?
Product common info, i.e. title, description, brand, category ...

## Models

* What modeling Techniques do you plan on trying?
Naive Bayes or logistic regression

* How will you compare the models
Use R function anova(fit1, fit2) for example 

## Deployment

* Who will use the model?
One of engineer teams to do importing and indexing data at same time the product categorization is happending

* How will the use it?
Analyze if the product input feed is good and publish to production or need to figure it out

## Miscellaneous

* What do you expect to learn from this Project?
How to build, compare, finalize a model, and generate reasonable data for further measuring.
