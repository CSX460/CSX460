# CSX460 Project
#data from https://www.kaggle.com/c/sf-crime
library(cluster)
library(dplyr)
library(ggplot2)
library(data.table)
library(reshape2)
library(readr)
library(lubridate)
library(ipred)
library(ggmap)
library(rpart)
train <- read.csv("Downloads/train.csv",nrow = 100000)

train <- filter(train, Category != "OTHER OFFENSES", Category != "NON-CRIMINAL", Category != "WARRANTS")
train$Year <- year(ymd_hms(train$Dates))
crimes <- table(train$Category,train$Year)
crimes <- melt(crimes)
names(crimes) <- c("Category","Year","Count")
crimes<- data.table(crimes)
crimes
offence_against_the_people=c( "ASSAULT", "RUNAWAY", "SUICIDE", "FAMILY OFFENSES", "MISSING PERSON", 
                              "SEX OFFENSES FORCIBLE", "SEX OFFENSES NON FORCIBLE", "KIDNAPPING", "EXTORTION", "EMBEZZLEMENT")
violent_offence=c("DRIVING UNDER THE INFLUENCE", "DISORDERLY CONDUCT", "DRUNKENNESS",
                  "LOITERING", "LIQUOR LAWS", "WEAPON LAWS", "DRUG/NARCOTIC", 
                  "PROSTITUTION", "BRIBERY", "PORNOGRAPHY/OBSCENE MAT", "VANDALISM", "GAMBLING", "SUSPICIOUS OCC")


offence_against_property=c("VEHICLE THEFT", "ROBBERY", "BURGLARY", "FRAUD", "ARSON", "TRESPASS",
                           "LARCENY/THEFT", "FORGERY/COUNTERFEITING", "RECOVERED VEHICLE", 
                           "FRAUD",  "STOLEN PROPERTY", "BAD CHECKS" )
other_crimes=c("OTHER OFFENSES", "SECONDARY CODES", "TREA")
"%ni%" <- Negate("%in%")
crimes[, SubCategory := character(nrow(crimes))]
crimes[Category %in% offence_against_the_people, SubCategory := "OFFENCE AGAINST THE PEOPLE"]
crimes[Category %in% violent_offence, SubCategory := "VIOLENT OFFENCE"]
crimes[Category %in% offence_against_property, SubCategory := "OFFENCE AGAINST THE PROPERTY"]
crimes[Category %in% other_crimes, SubCategory := "OTHER CRIMES"]
g <- ggplot(crimes,aes(x=Year, y=Count,fill = SubCategory)) + 
  geom_bar(stat = "identity")+
  coord_flip() +
  facet_grid(.~SubCategory) +
  labs(title=" OFFENCE AGAINST THE PROPERTY is the most crimes committed in SF")

map <- readRDS("../input/sf_map_copyright_openstreetmap_contributors.rds")

map_crime <- function(crime_df, crime) {
  filtered <- filter(crime_df, SubCategory %in% crime)
  plot <- ggmap(map, extent='device') + 
    geom_point(data=filtered, aes(x=X, y=Y, color=Category, alpha=0.6))
  return(plot)
}
map_crime(crimes,c("OFFENCE AGAINST THE PROPERTY"))


## Requirements

1. Identify one machine learning problem you want to tackle. It could be from existing UCI data sets, your work, interest, Kaggle ? or I can give you one.
2. Frame the problem (identify the inputs and outputs
3. Build Features 
4. Build linear model and cart models
5. Build (several) advanced models
6. Develop Deployment Strategy 
7. Deploy Model





