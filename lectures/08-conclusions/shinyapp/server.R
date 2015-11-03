
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

shinyServer(function(input, output) {

#   output$distPlot <- renderPlot({
#
#     # generate bins based on input$bins from ui.R
#     x    <- faithful[, 2]
#     bins <- seq(min(x), max(x), length.out = input$bins + 1)
#
#     # draw the histogram with the specified number of bins
#     hist(x, breaks = bins, col = 'darkgray', border = 'white')
#
#   })

  newdat <- reactive({
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
