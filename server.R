library(shiny)
library(plotly)
library(dplyr)

source('./scripts/graph1.R')
source('./scripts/graph2.R')
source('./scripts/graph3.R')

 player.stats <- read.csv('./data/2015-16playerpergame.csv', stringsAsFactors = FALSE)
 advanced.stats <- read.csv('./data/2015-16advanced.csv', stringsAsFactors = FALSE)
 team.stats <- read.csv('./data/2015-16team.csv', stringsAsFactors = FALSE)
 player.joined <- left_join(player.stats,advanced.stats, by=c("Player", "Tm"))
 full.joined <- left_join(player.joined,team.stats, by="Tm")


# Start shinyServer
shinyServer(function(input, output) { 
  
  # Render a plotly object that returns your map
  output$scatter1 <- renderPlotly({
    return(BuildGraph1(full.joined, input$statvar))
  }) 
  
  output$scatter2 <- renderPlotly({
    return(BuildGraph2(team.stats))
  })
  
  output$scatter3 <- renderPlotly({
    return(BuildGraph3(player.joined, input$dstat, input$psearch))
  })
})