# CSX460 Project Proposal

Team Member(s):


## Model Objective

* What do you expect to achieve with the model?
* How will you measure its performance?


## Data Source(s)

* What are the data sources for the model?
* How will you obtain the data?

	The data comes from the Current Population Survey (CPS), which collects demographic and employment information from a wide range of Americans each month.
	The data can be downloaded from http://thedataweb.rm.census.gov/ftp/cps_ftp.html
	
	The explanatory variables are
	`PeopleInHousehold`: The number of people in the interviewee's household.
	`Region`: The census region where the interviewee lives.
	`State`: The state where the interviewee lives.
	`MetroAreaCode`: A code that identifies the metropolitan area in which the interviewee lives (missing if the interviewee does not live in a metropolitan area). 
	`Age`: The age, in years, of the interviewee. 80 represents people aged 80-84, and 85 represents people aged 85 and higher.
	`Married`: The marriage status of the interviewee.
	`Sex`: The sex of the interviewee.
	`Education`: The maximum level of education obtained by the interviewee.
	`Race`: The race of the interviewee.
	`Hispanic`: Whether the interviewee is of Hispanic ethnicity.
	`CountryOfBirthCode`: A code identifying the country of birth of the interviewee.
	`Citizenship`: The United States citizenship status of the interviewee.
	`Industry`: The industry of employment of the interviewee (only available if they are employed).

## Response

* What it the response variables?
* Are there any surrogate response variables?

	The response variable is `EmploymentStatus` -- The status of employment of the interviewee.
	There are no surrogate response variables.

## Expected Features

* What are some of the feature you expect to use?

	`Education` - No high school diploma; High school; Some college, no degree; Associate degree; Bachelor's degree; Master's degree; Doctorate degree.
	`State` - All U.S. states.
	`Sex` - Male; Female.

## Models

* What modeling techniques do you plan on trying?
* How will you compare the models?

	Logistic regression, CART, Random Forest, etc.
	First plot predicted and actual status of employment. Then comparing the sum of squared errors of prediction (SSE) of different models.


## Deployment

* Who will use the model?
* How will the use it?

	Someone concerned about employment status? Mostly for my own practice.

## Miscellaneous

* What do you expect to learn from this Project?
	
	Learn how to use more advanced models in R. Make some meaningful predictions from real data.
