#server.R

NBA <- read.csv("Data/NBA.csv")

shinyServer(function(input, output) {
    
    top10 <- reactive({
        NBA <- NBA[order(NBA[ ,input$var], decreasing = TRUE), ]
        NBA <- NBA[1:10,]
        #this gives back all of NBA sorted by the variable I select
    })
    
        names <- reactive({
             names <- top10()[1:10, "Team"]
        })
    
    # Fill in the spot we created for a plot
    output$plot <- renderPlot({
    
        # Render a barplot
        barplot(top10()[, input$var], names.arg = names(), col = "orange",
                xlab = "Teams", ylab = input$var, main = c("Top 10 NBA teams in ", input$var))
    })
    
})