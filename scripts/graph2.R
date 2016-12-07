#Create scatter plot That shows teams success of offense vs defense
#Create function BuildGraph2 with 2 parameters: the data set and the search value
#Create plotly scatter plot with offensive rating in x and defensive rating as y, with the size of the plot points as the team wins
# display necesssary information when it hovers, such as team name, offensive rating, defensive rating, and team wins
# display information such that the user types in a fragment and plot will show all points that match what the user types in
library(rsconnect)
library(plotly)
library(dplyr)

# This is not filtering on size :( and the year isn't working either
BuildGraph2 <- function(year) {
  team.stats <- paste0("./data/20", year, "team.csv")
  dataset <- read.csv(team.stats)
  x.equation <- paste0("~", "ORtg")
  y.equation <- paste0("~", "DRtg")
   graph <- plot_ly(
    data = dataset, 
    x = eval(parse(text = x.equation)), 
    y = eval(parse(text = y.equation)),
    color = ~Div, size = ~W, opacity = 0.5, 
    type = 'scatter', sizes = c(10, 30),
    mode = 'markers', hoverinfo = 'text',
    text = ~paste('Team Name: ', Team,
            '</br> Offensive Rating: ', ORtg,
            '</br> Deffensive Rating: ', DRtg,
            '</br> Wins: ', W)
  )
  return (graph)
}



