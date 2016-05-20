#server.R

library(ggplot2)
library(DT)
WHO <- read.csv("Data/NBA.csv")
mtcars <- mtcars

shinyServer(function(input, output) {
    
    top10 <- reactive({
        NBA <- NBA[order(NBA[ ,input$var], na.last = TRUE, decreasing = TRUE), ]
    })
    
    names <- reactive({
        names <- top10()[1:10, "Team"]
    })
    
    # Fill in the spot we created for a plot
    output$plot <- renderPlot({
    
        # Render a barplot
        barplot(top10()[1:10, input$var], names.arg = names(), main = input$var)

        
    })

})

