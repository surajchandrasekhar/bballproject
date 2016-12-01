#Create scatter plot That shows teams success of offense vs defense
#Create function BuildGraph2 with 2 parameters: the data set and the search value
#Create plotly scatter plot with offensive rating in x and defensive rating as y, with the size of the plot points as the team wins
# display necesssary information when it hovers, such as team name, offensive rating, defensive rating, and team wins
# display information such that the user types in a fragment and plot will show all points that match what the user types in
#library(plotly)
#library(stringr)

BuildGraph2 <- function(dataset, input) {
  
  #data <- dataset %>% filter(grepl(input, Team))
  
  graph <- plot_ly(
    dataset, x = ~dataset$ORtg, y = ~dataset$DRtg,
    color = ~Tm, size = ~W, type = 'scatter',
    mode = 'markers', hoverinfo = 'text',
    text = ~paste('Team Name: ', Team,
            '</br> Offensive Rating: ', ORtg,
            '</br> Deffensive Rating: ', DRtg,
            '</br> Wins: ', W)
  )
  return (graph)
}



