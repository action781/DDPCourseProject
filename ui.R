#ui.R

library(shiny)

shinyUI(fluidPage(
    titlePanel("Top 10 NBA Teams For Each Statistical Category"),
    
    sidebarLayout(
        sidebarPanel(
            # Define the sidebar with one input
                selectInput("var", "Select the Statistic:", 
                            choices=colnames(NBA[2:16])
                ),
                p("Key:"),
                p("FGP = Field Goal Percentage"),
                p("X3PM = Made 3 point shots"),
                p("X3PA = Attempted 3 point shots"),
                p("x3PP = 3 Point Percentage"),
                p("FTM = Free Throws Made"),
                p("FTA = Free Throws Attempted"),
                p("FTP = Free Throw Percentage"),
                p("Turnovers = Turnovers"),
                p("OReb = Offensive Rebounds"),
                p("DReb = Defensive Rebounds"),
                p("TotalReb = Total Rebounds"),
                p("Assists = Assists"),
                p("Steals = Steals"),
                p("Blocks = Blocks"),
                p("Points = Points")
        ),
    
        mainPanel(
            p("This shiny app will display a bar graph of the top 10 NBA teams in the NBA 2015-2016 season for any of the statistical categories in the drop down menu on the left of the page.  All stats are on a per game basis except for the percentage statistics."),
            plotOutput("plot"),
            h6("You might need to full screen your internet browser to read all the names"),
            h6("This data was downloaded for free from www.basketball-reference.com")
        )
    )
))





