library(shiny)
library(plotly)
library(dplyr)

source('./scripts/graph1.R')
source('./scripts/graph2.R')
source('./scripts/graph3.R')


# Start shinyServer
shinyServer(function(input, output) { 
  
  # Render a plotly object that returns your map
  output$scatter1 <- renderPlotly({
    dataset <- read.csv("./data/nbastats.csv")
    dataset <- filter(dataset, Season == eval(parse(text=input$year1)))
    return(BuildGraph1(dataset, input$statvar))
  }) 
  
  output$scatter2 <- renderPlotly({
    dataset <- read.csv("./data/2015-16data.csv")
    return(BuildGraph2(dataset))
  })
  
  output$scatter3 <- renderPlotly({
    dataset <- read.csv("./data/2015-16data.csv")
    return(BuildGraph3(dataset, input$dstat, input$psearch))
  })
})