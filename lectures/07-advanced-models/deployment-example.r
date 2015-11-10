library(plyr)


# Create a command-line application for scoring iris' based on
#


data(iris)
dat <- iris

# Create Features
# ----------------------------------------


## user-frame transformations
## ----------------------------------------
##   these transformation make the data appear as it would from the
##   perspective of the user
  names(dat) <- tolower( names(dat) )         # names of variables

## Transformation to the data set, e.g. user input in inches
##   User will provide input in inches
  dat$petal.length <- dat$petal.length/2.54
  dat$petal.width  <- dat$petal.width/2.54


## Parameterized transformation
## --------------------------------------
##   Best to create parameters, not to apply them
  scale.petal.width <- scale(dat$petal.width,center=TRUE,scale=FALSE)
  delta.petal.width <- attr(scale.petal.width,"scaled:center")  # subtract 0.472 from user input


## Feature Development
##   This function create a rectangular frame from which training
##   and scoring can be completed
##
##   CAUTION: non-idempotent!!

featurize <- function(data) {

  data$petal.width <- data$petal.width - 0.472  # use of value not
  data

}



# Fit the model
dat <- featurize(dat)
fit <- train( species ~ petal.length + petal.width , dat, maxdepth=4, method="rpart" )

proto <- dat[0,]   # Retains meta.data information use with `plyr::rbind.fill`

# Save model(fit), feature

file =
  "C:/Users/Christopher/Documents/dp/code/csx460/lectures/07-advanced-models/deployment.RData"
  "data/deployed-model.RData"
save(fit, proto, featurize, file=file)




# package variant!!!

# Scoring (application logic)
# -------------------------------------------
#   This part is embedded in what gets

load(file=file)

## Input (perhaps a subset of modeling data)
##  Placeholder
  newdat <- data.frame( petal.width = 0.50, petal.length = 1.50 )

## bind with prototype
newdat <-
  plyr::rbind.fill(newdat,proto)   # Important, use rbind.fill

# Featurize
  newdat <- featurize(newdat)

## Predict
  predict(fit,newdat)



