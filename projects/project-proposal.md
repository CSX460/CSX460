# CSX460 Project Proposal


## Model Objective

* What do you expect to achieve with the model?
* How will you measure its performance?

To estimate the model and predict what sorts of people survived.

For each passenger in the test set, predict whether or not they survived the sinking ( 0 for deceased, 1 for survived ). The final score is the percentage of passengers correctly predict.


## Data Source(s)

* What are the data sources for the model?
* How will you obtain the data?

VARIABLE DESCRIPTIONS:
survival        Survival
                (0 = No; 1 = Yes)
pclass          Passenger Class
                (1 = 1st; 2 = 2nd; 3 = 3rd)
name            Name
sex             Sex
age             Age
sibsp           Number of Siblings/Spouses Aboard
parch           Number of Parents/Children Aboard
ticket          Ticket Number
fare            Passenger Fare
cabin           Cabin
embarked        Port of Embarkation
                (C = Cherbourg; Q = Queenstown; S = Southampton)

The historical data has been split into two groups, a 'training set' and a 'test set'. For the training set, Kaggle provide the outcome ( 'ground truth' ) for each passenger. I will use this set to build my model to generate predictions for the test set.


## Response

* What it the response variables?
* Are there any surrogate response variables?

PassengerId (which can be sorted in any order)
Survived (which contains your binary predictions: 1 for survived, 0 for did not).

No.


## Expected Features

* What are some of the feature you expect to use?

Survived: 0, 1
Pclass: 1, 2, 3
Sex: male, female
Age: 0 - 80


## Models

* What modeling Techniques do you plan on trying?
* How will you compare the models

Random Forest.

Plot the model and see which one is better. Also compare the scores of different models.


## Deployment

* Who will use the model?
* How will the use it?

This is a getting start Kaggle competition, it's for practice. No one will use it.


## Miscellaneous

* What do you expect to learn from this Project?

Using machine learning algorithm to solve an actual problem and getting start on Kaggle.
