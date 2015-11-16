
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
# options(showWarnCalls=FALSE)
# options( warn=-1)
# options( verbose = FALSE )

library(caret, quietly = T, verbose = FALSE)
library(plyr, quietly = T, verbose = FALSE)

load("models.RData")
# data(model)

shinyServer( function(input, output) {

  newdat <- reactive({
    # browser()
    df <- data.frame( petal.width = input$pw, petal.length = input$pl )
    df <- plyr::rbind.fill(df,proto)
    featurize(df)
  })

  species <- reactive({
    predict(fit$finalModel,newdat(), type="class")
  })

  # READ AND ALTER INPUTS
  output$species <-
    renderText( paste0("The species is: ", species() ) )
})
