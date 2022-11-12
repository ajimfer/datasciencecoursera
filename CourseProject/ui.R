#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Three aspects of automobile design and performance"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("cyl",
                        "Number of cylinders:",
                        min = 4,
                        max = 8,
                        value = -c(5,7)),
            sliderInput("hp",
                        "Max Gross horsepower:",
                        min = 52,
                        max = 335,
                        value = c(100,193)),
            sliderInput("wt",
                        "Max Weight (1000 lbs):",
                        min = 1.513,
                        max = 5.424,
                        value = c(2,3.47)),
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h3("Miles/(US) gallon:"),
            plotOutput("plot")
        )
    )
))
