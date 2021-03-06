library(dplyr)
library(plotly)
#This Scatter Plot will compare the ppg of the leading scorer of each team with a selected efficiency category the user chooses
#create function BuildGraph1, with 2 parameters: the data set and the variable the user wants to compare with
#use dplyr to filter out only the leading scorer of each team
#create plotly scatter plot with x as Points per game, and y variable as the user selected variable, and as size being the number of wins the team had
#display the important information, like player name, team name, team wins, and other information you find necessary
# theres a string literal here 
BuildGraph1 <- function(dataset, year1, statvar, xvar ='PS.G') {
 dataset <- filter(dataset,Season == year1)
  newdata <- filter(dataset, G.x > 41) %>% 
    group_by(Tm) %>% 
    filter(PS.G == max(PS.G))
  x.equation = paste0("~",xvar)
  y.equation = paste0("~",statvar)
  p <- plot_ly(
    newdata, 
    x = eval(parse(text = x.equation)), 
    y = eval(parse(text = y.equation)),
    color = ~Team, size = ~W, opacity = 0.5, sizes = c(1, 30),
    mode = 'markers', hoverinfo = 'text',
    text = ~paste('Player: ', Player,
                  '</br> Team: ', Team,
                  '</br> Points Per Game: ', PS.G,
                  '</br>', statvar,": ", eval(parse(text = statvar)),  #string literal
                  '</br> Wins: ', W)
  )
  return (p)
}
