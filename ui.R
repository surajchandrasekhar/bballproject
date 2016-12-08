library(dplyr)
library(shiny)
library(plotly)

shinyUI(navbarPage('NBA Statistics',
                   # Create a tab panel for your map
                   tabPanel("Proj Info", 
                            titlePanel("Gleaning Data from NBA Statistics"), 
                            mainPanel("Suraj writes stuff")
                            ), 
                   tabPanel('Leading Scorer',
                            titlePanel("How Important is the Leading Scorer's efficiency for a team to win games?"),
                            # Create sidebar layout
                            sidebarLayout(
                              
                              # Side panel for controls
                              sidebarPanel(
                                
                                # Input to select variable to map
                                selectInput('year1', label = 'Select Which Season To Look At:', 
                                            choices = list("2006-07" = '2006-07',
                                                           "2007-08" = '2007-08',
                                                           "2008-09" = '2008-09', 
                                                           "2009-10" = '2009-10',
                                                           "2010-11" = '2010-11',
                                                           "2011-12" = '2011-12',
                                                           "2012-13" = '2012-13', 
                                                           "2013-14" = '2013-14',
                                                           "2014-15" = '2014-15',
                                                           "2015-16" = '2015-16')
                              ),
                                selectInput('statvar', label = 'Which Efficiency Stat Do You Want to compare with:', 
                                            choices = list("Field Goal %" = 'FG.', 
                                                           "3 Point %" = 'X3P.', 
                                                           "Effective Field Goal %" = 'eFG.',
                                                           "True Shooting %" = 'TS.',
                                                           "Usage Rate" = 'USG.',
                                                           "Value Over Replacement Player (VORP)" = 'VORP',
                                                           "Player Efficiency Rating (PER)" = 'PER'))
                              ),
                              
                              # Main panel: display plotly map
                              mainPanel(
                                plotlyOutput('scatter1')
                              )
                            )
                   ),
                   tabPanel('Team Data',
                            titlePanel('Is Offense or Defense more important to a Teams Success?'),
                            # Create sidebar layout
                            sidebarLayout(
                              
                              # Side panel for controls
                              sidebarPanel(
                                
                                # Input to select variable to map
                                selectInput('year2', label = 'Select Which Season To Look At:', 
                                            choices = list("06-07" = '06-07',
                                                           "07-08" = '07-08',
                                                           "08-09" = '08-09', 
                                                           "09-10" = '09-10',
                                                           "10-11" = '10-11',
                                                           "11-12" = '11-12',
                                                           "12-13" = '12-13', 
                                                           "13-14" = '13-14',
                                                           "14-15" = '14-15',
                                                           "15-16" = '15-16')
                              )
                              ),
                              
                              # Main panel: display plotly map
                              mainPanel(
                                plotlyOutput('scatter2')
                              )
                            )
                   ),
                   
                   # Create a tabPanel to show your scatter plot
                   tabPanel('Defense',
                            # Add a titlePanel to your tab
                            titlePanel('Does Blocks Or Steals Make you an Effective Defender'),
                            
                            # Create a sidebar layout for this tab (page)
                            sidebarLayout(
                              
                              # Create a sidebarPanel for your controls
                              sidebarPanel(
                                
                                # Make a textInput widget for searching for a state in your scatter plot
                                selectInput('year3', label = 'Select Which Season To Look At:', 
                                            choices = list("06-07" = '06-07',
                                                           "07-08" = '07-08',
                                                           "08-09" = '08-09', 
                                                           "09-10" = '09-10',
                                                           "10-11" = '10-11',
                                                           "11-12" = '11-12',
                                                           "12-13" = '12-13', 
                                                           "13-14" = '13-14',
                                                           "14-15" = '14-15',
                                                           "15-16" = '15-16')
                                ),
                                radioButtons('dstat', 
                                             label="Choose a Defensive Statistic", 
                                             choices = list("Steals" = 'STL',
                                                            "Blocks" =  'BLK')
                                ),
                                textInput('psearch', label = 'Choose a Player', value='')
                              ),
                              
                              # Create a main panel, in which you should display your plotly Scatter plot
                              mainPanel(
                                plotlyOutput('scatter3')
                              )
                            )
                   )
))
