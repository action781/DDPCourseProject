#ui.R

#WHO Database 2012

library(shiny)

shinyUI(fluidPage(
    titlePanel("Literacy Rate Across the World by Region"),
    
    sidebarLayout(
        sidebarPanel(
            # Define the sidebar with one input
                selectInput("var", "Select the Variable:", 
                            choices=colnames(WHO[3:13])
                            )
                ),
    
        mainPanel(
            tabsetPanel(
                tabPanel("plot", plotOutput("plot")),
                tabPanel("table",
                         DT::dataTableOutput("table")
                )
                )
            )
    )
))



