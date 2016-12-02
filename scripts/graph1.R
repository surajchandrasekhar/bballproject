library(dplyr)
library(plotly)
#This Scatter Plot will compare the ppg of the leading scorer of each team with a selected efficiency category the user chooses
#create function BuildGraph1, with 2 parameters: the data set and the variable the user wants to compare with
#use dplyr to filter out only the leading scorer of each team
#create plotly scatter plot with x as Points per game, and y variable as the user selected variable, and as size being the number of wins the team had
#display the important information, like player name, team name, team wins, and other information you find necessary

# theres a string literal here 
BuildGraph1 <- function(dataset, stat) {
  newdata <- filter(dataset, G.x > 41) %>% 
    group_by(Tm) %>% 
    filter(PS.G == max(PS.G))
  p <- plot_ly(
    newdata, x = ~PS.G, y = ~stat.,
    color = ~Team, size = ~W,
    mode = 'markers', hoverinfo = 'text',
    text = ~paste('Player: ', Player,
                  '</br> Points Per Game: ', PS.G,
                  '</br> Effective Field Goal Percentage: ', stat, #string literal
                  '</br> Wins: ', W)
  )
  return (p)
}
