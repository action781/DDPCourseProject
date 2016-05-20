#ui.R

#WHO Database 2012

library(shiny)

shinyUI(fluidPage(
    titlePanel("Top 10 NBA Teams By Stat Category"),
    
    sidebarLayout(
        sidebarPanel(
            # Define the sidebar with one input
                selectInput("var", "Select the Variable:", 
                            choices=colnames(NBA[2:16])
                            )
                ),
    
        mainPanel(plotOutput("plot"))
    )
))



