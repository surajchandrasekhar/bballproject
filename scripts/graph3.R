# Jo Narvaez-Jensen
# Tech Team
# Using the Stats: Blocks, Steals vs Defensive Win Share (DWS); build a function that 
# accepts a ShinyUI input and returns a plot based on the user selected stat vs
# DWS, each point on hover displays the following info: player, team, steal, block,
# and DWS.  

# Original Notes: 
#Create scatter plot That shows players basic defensive stats vs the advanced defensive stats to show if steals or blocks constitutes a good defender
#Create function BuildGraph3 with 3 parameters: the data set, the value of the radio button, and the minimum value
#Create plotly scatter plot with the radio button inputed value in x and defensive box plus-minus as y, with the size of the plot 
#points as the defensive win shares
# display necesssary information when it hovers, such as Player Name, Defensive box-plus minus, defensive win shares, blocks, and steals
# display information such that only players that have more steals or blocks than the slider value will be displayed.



# Libraries
library(shiny)
library(dplyr)
library(plotly)

# Create Overall Defensive Data Set 

# Function to create scatter plot based on block or steal vs defensive win share
BuildGraph3 <- function(dataset, dstat, psearch){
  
  
  # Create Data Frame limtied to user selected stat
  x.equation = paste0("~",dstat)
  dataset <- filter(dataset, MP.x >= 20.0)
  newdata <- dataset %>% filter(grepl(psearch, Player))

  # Create a scatter plot of selected stat
  p <- plot_ly(
    newdata,
    x = eval(parse(text = x.equation)), 
    y = ~DBPM,
    size=~DWS,
    color = ~Tm, type = 'scatter',
    opacity = 0.5,
    sizes=c(10,100),
    mode = 'markers', hoverinfo = 'text',
    
    text = ~paste('Player: ', Player,
                  '</br> Team: ', Team,
                  '</br> Steal: ', STL,
                  '</br> Block: ', BLK,
                  '</br> Defensive Share: ', DWS)
  )
  
  return (p)

}