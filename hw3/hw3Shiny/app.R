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
q1p3_1 <- readRDS("q1p3_1.rds")
q1p3_2 <- readRDS("q1p3_2.rds")
q1p4 <- readRDS("q1p4.rds")

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
  ), 


  
#porblem 1 question 3
  tabPanel(
    "Which Department Earns the Most?", 
    sidebarLayout(
      sidebarPanel(
        numericInput(
          "department",
          "Choose the number of highest paid departments",
          5, min = 0, max = 30
        ), 
        numericInput(
          "year2",
          "Choose the year",
          2017, min = 2013, max = 2017
        ),
        radioButtons(
          "Method",
          "Choose the method of displaying",
          c("Median", "Mean"), "Median"
        )
      ),
      mainPanel( 
        tableOutput("q1p3Table"))
    )
  ), 

#Problem 1 question 4
  tabPanel(
    "Which Department costs the most?",
    sidebarLayout(
      sidebarPanel(
        numericInput(
          "department2", 
          "Choose the number of highest cost department", 
          5, 
          min = 0, 
          max = 30
        ), 
        numericInput(
          "year3", 
          "Choose the year", 
          2017, min = 2013, max = 2017
        )
      ), 
      mainPanel(
        tableOutput("q1p4Table")
      )
    )
  ) 

)


server <- function(input, output) {
   
  output$q1p1Plot <- renderPlot({
    ggplot(data = q1p1) +
      geom_bar(mapping = aes(x = Year, y = payments, fill = class), 
                stat = "identity")
  })
  
  output$q1p2Table <- renderTable({
    q1p2 %>% filter(Year == input$year) %>% head(n = input$n) 
  })
  
  output$q1p3Table <- renderTable({
    if (input$Method == "Median"){
      q1p3_2 %>% filter(Year == input$year2) %>% head(n = input$department)
    }
    else{
      q1p3_1 %>% filter(Year == input$year2) %>% head(n = input$department)
    }
  })
  
  output$q1p4Table <- renderTable({
    q1p4 %>% filter(Year == input$year3) %>% head(n = input$department2) 
  })
  
}



shinyApp(ui = ui, server = server)

