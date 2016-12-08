library(shiny)
library(plotly)
library(dplyr)

source('./scripts/graph1.R')
source('./scripts/graph2.R')
source('./scripts/graph3.R')


# Start shinyServer
shinyServer(function(input, output) { 
  dataset <- read.csv("./data/nbastats.csv")
  
  # Render a plotly object that returns your map
  output$scatter1 <- renderPlotly({
    return(BuildGraph1(dataset,input$year1,input$statvar))
  }) 
  
  output$scatter2 <- renderPlotly({
    return(BuildGraph2(dataset, input$year2))
  })
  
  output$scatter3 <- renderPlotly({
    return(BuildGraph3(dataset, input$year3,input$dstat, input$psearch))
  })
})