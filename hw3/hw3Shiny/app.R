############################
# Diyang Wu                #
# Biostats M280            #
# Homework 3 (ShinyApp)    #
############################

library(shiny)
library(ggplot2)
library(tidyverse)
library(markdown)
library(shinythemes)



q1p1 <- readRDS("q1p1.rds")
q1p1

q1p2 <- readRDS("q1p2.rds")

# Define UI for application that draws a histogram
ui <- navbarPage(
  theme = shinytheme("sandstone"), 
  "LA City Employee Payroll",
  
#Problem 1 Question 1  
  tabPanel(
    "Total Payroll by LA City",
    mainPanel(
         plotOutput("q1p1Plot")
      )
  ), 

#Problem 1 Question 2   
  tabPanel(
    "Who Earned Most?",
    sidebarLayout(
      sidebarPanel(
        numericInput(
          "n", 
          "Choose the number of highest paid employees", 
          10, 
          min = 0, 
          max = 30
        ), 
        numericInput(
          "year", 
          "Choose the year", 
          2017, min = 2013, max = 2017
        )
      ), 
      mainPanel(
        tableOutput("q1p2Table")
      )
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
  output$q1p1Plot <- renderPlot({
    ggplot(data = q1p1) +
      geom_bar(mapping = aes(x = Year, y = payments, fill = class), 
                stat = "identity")
  })
  
  output$q1p2Table <- renderTable({
    q1p2 %>% filter(Year == input$year) %>% head(n=input$n) 
  })
  
  
}



shinyApp(ui = ui, server = server)

