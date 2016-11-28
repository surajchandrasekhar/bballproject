library(shiny)
library(plotly)
library(dplyr)

source('./scripts/graph1.R')
source('./scripts/graph2.R')
source('./scripts/graph3.R')

# player <- read.csv('./data/2014-15playerpergame.csv', stringsAsFactors = FALSE)
# advanced <- read.csv('./data/2014-15advanced.csv', stringsAsFactors = FALSE)
# team <- read.csv('./data/2014-15team.csv', stringsAsFactors = FALSE)
# player.joined <- left_join(player,advanced, by=c("Player", "Tm"))
# full.joined <- left_join(player.joined,team, by="Tm")


# Start shinyServer
shinyServer(function(input, output) { 
  
  # Render a plotly object that returns your map
  output$scatter1 <- renderPlotly({
    player.stats <- read.csv(paste0("./data/",input$year1,"playerpergame.csv"))
    advanced.stats <- read.csv(paste0("./data/",input$year1,"advanced.csv"))
    team.stats <- read.csv(paste0("./data/",input$year1,"team.csv"))
    player.joined <- left_join(player.stats,advanced.stats, by="Player")
    full.joined <- left_join(player.joined,team.stats, by="Tm")
    return(BuildGraph1(full.joined, input$statvar))
  }) 
  
  output$scatter2 <- renderPlotly({
    team.stats <- read.csv(paste0("./data/",input$year2,"team.csv"))
    return(BuildGraph2(team.stats, input$search))
  })
  
  output$scatter3 <- renderPlotly({
    player.stats <- read.csv(paste0("./data/",input$year3,"playerpergame.csv"))
    advanced.stats <- read.csv(paste0("./data/",input$year3,"advanced.csv"))
    player.joined <- left_join(player.stats,advanced.stats, by="Player")
    return(BuildGraph3(player.joined, input$dstat,input$qty))
  })
})