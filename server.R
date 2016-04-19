#server.R

library(ggplot2)
library(dplyr)
install.packages("DT")
library(DT)
WHO <- read.csv("Data/WHO.csv")

shinyServer(function(input, output) {
    
    top10 <- reactive({
       arrange(WHO, desc(input$var))[1:10,]
       }) 

      
    output$plot <- renderPlot({
        barplot(top10(), 
                main=input$var,
                ylab=input$var,
                xlab="Country")    
        })
    
    output$table <- DT::renderDataTable({
        DT::datatable(top10())
        
    })
    
}
)


##top 10 pareto chart
# person picks variable and my chart shows the top 10 countries for each
# another tab shows table
# 
# 
# varswitch <- switch(input$var, 
#                     "Percent White" = counties$white,
#                     "Percent Black" = counties$black,
#                     "Percent Hispanic" = counties$hispanic,
#                     "Percent Asian" = counties$asian)


