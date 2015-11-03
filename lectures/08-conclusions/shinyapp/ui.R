
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("RA Fischer's Iris Model"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("pl",
                  "Petal Length (inches)",
                  min = 0.40,
                  max = 2.72,
                  value = 0.40),

      sliderInput("pw",
                  "Petal Width (inches)",
                  min = 0.04,
                  max = 1.0,
                  value = 0.04
                  )

    ),

    # Show a plot of the generated distribution
    mainPanel(
      h2(textOutput("species"))
      # , plotOutput("distPlot")
    )

  )
)
)
