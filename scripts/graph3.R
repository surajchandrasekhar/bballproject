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
library(magrittr)

# Create Overall Defensive Data Set 
getwd()

def.df <- read.csv("./data/2015-16advanced.csv", stringsAsFactors = FALSE)

def.df <- def.df %>% 
  select(Player, `Team` = Tm, `Steal` = STL., `Block` = BLK., DWS)


# Function to create scatter plot based on block or steal vs defensive win share
BuildGraph3 <- function (dataset, input){
  
  # Create Data Frame limtied to user selected stat
  filtered <- dataset %>% 
    select (Player, Team, `Stat` = grep(input$Stat, colnames(iris)), DWS)
  
  
  # Create a scatter plot of selected stat
  def.plot <- plot_ly(
    filtered, x = ~filtered$Stat, y = ~filtered$DWS,
    color = ~Player, type = 'scatter',
    mode = 'markers', hoverinfo = 'text',
    
    text = ~paste('Player: ', Player,
                  '</br> Team: ', Team,
                  '</br> Steal: ', Steal,
                  '</br> Black: ', Block,
                  '</br> Defensive Share: ', DWS)
    )
  
  return (def.plot)

}