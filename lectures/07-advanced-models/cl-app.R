
options(showWarnCalls=FALSE)
options( warn=-1)
options( verbose = FALSE )

library(optigrab, quietly = T, verbose = FALSE, warn.conflicts = FALSE)
library(caret, quietly = T, verbose = FALSE)
library(plyr, quietly = T, verbose = FALSE)
library(magrittr, quietly = T, verbose = FALSE)

# Usage:
#   Use Rscript[.exe]:
#      "\Program Files\R\R-3.2.1\bin\Rscript.exe" cl.R


# Load specifications
  file =
  "C:/Users/Christopher/Documents/dp/code/csx460/lectures/07-advanced-models/deployment.RData"

  load(file)


# Inputs
  pl   = opt_get( c("pl","petal.length"), default=1.50 )
  pw   = opt_get( c("pw","petal.width"), default=0.50 )
  type = opt_get( c("t","type"), default="type")

## Input (perhaps a subset of modeling data)
##  Placeholder
newdat <- data.frame( petal.width = pw, petal.length = pl )

## bind with prototype
newdat <-
  plyr::rbind.fill(newdat,proto)   # Important, use rbind.fill

# Featurize
newdat <- featurize(newdat)

## Predict
##
cat( "Predicting ", type, " with\n")
cat( "  Petal.Width    : ", pw, "\n")
cat( "  Petal.Width    : ", pl, "\n")

out <-
  predict(fit$finalModel,newdat, type="class") %>% as.character

cat(out)
