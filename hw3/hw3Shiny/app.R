#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

q1p1 <- readRDS("./data/q1p1.rds")
q1p1

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("LA City Payroll by Year"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("bins",
                     "Number of bins:",
                     min = 1,
                     max = 50,
                     value = 30)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("plot_q1p1")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
     ggplot(data = q1p1) + 
       geom_bar(mapping = aes(x = Year, fill = Total_Payments, Base_Pay, 
                              Overtime_Pay, Other_Pay), position = "dodge")
     })
     
     #renderPlot({
      # generate bins based on input$bins from ui.R
     # x    <- q1p1[, 2] 
      #bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      # draw the histogram with the specified number of bins
      #barplot(x, breaks = bins, col = 'darkgray', border = 'white')
   #})
#}
}
# Run the application 
shinyApp(ui = ui, server = server)

