############################
# Diyang Wu                #
# Biostats M280            #
# Homework 3 (ShinyApp)    #
############################

library(shiny)
library(ggplot2)

q1p1 <- readRDS("q1p1.rds")
q1p1

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("LA City Payroll by Year"),
   
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("q1p1Plot")
      )
   )


# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$q1p1Plot <- renderPlot({
     ggplot(data = q1p1) +
       geom_bar(mapping = aes(x = Year, y = payments, fill = class), 
                stat = "identity")
     })
}
shinyApp(ui = ui, server = server)

