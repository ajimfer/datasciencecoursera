#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#

library(shiny)
library(dplyr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  output$plot <- renderPlot({
    min_cyl <- input$cyl[1]
    max_cyl <- input$cyl[2]
    min_hp <- input$hp[1]
    max_hp <- input$hp[2]
    min_wt <- input$wt[1]
    max_wt <- input$wt[2]
    
    x <- filter(mtcars, mtcars$cyl>=min_cyl) 
    x <- filter(x, x$cyl<=max_cyl) 
    x <- filter(x, x$hp>=min_hp) 
    x <- filter(x, x$hp<=max_hp) 
    x <- filter(x, x$wt>=min_wt) 
    x <- filter(x, x$wt<=max_wt)
    mpg <- x[,1]
    #  cyl <- seq(min(x), max(x), length.out = input$cyl + 1)
    
    # draw the histogram with the specified number of bins
    hist(mpg, breaks = 10, col = 'darkgray', border = 'white',
         xlab = 'mpg',
         main = 'Histogram of Miles/(US) gallon')
    
  })
  
})

