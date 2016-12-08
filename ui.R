library(dplyr)
library(shiny)
library(plotly)

shinyUI(navbarPage('NBA Statistics',
                   # Create a tab panel for your map
                   tabPanel("Proj Info", 
                            titlePanel("Gleaning Data from NBA Statistics"), 
                            mainPanel(img(src = "NBA_photo.png", height = 300, width = 300),
                                      img(src="https://scontent.xx.fbcdn.net/v/t1.0-9/13151594_1213068612044309_1817749460380821887_n.jpg?oh=60ee2ab84066df6b142c8ac52e8b8981&oe=58B5CA82", height = 100, width = 100),
                                      
                                      img(src="https://scontent.xx.fbcdn.net/v/t1.0-1/c0.13.50.50/p50x50/13654213_1484712278220822_807099208394567818_n.jpg?oh=401b89c64a8302cedde2d7cabeba5e66&oe=58AE2A60", height = 100, width = 100),
                                      img(src="https://scontent.xx.fbcdn.net/v/t1.0-1/c8.0.50.50/p50x50/14716358_10157905841285227_4407687058356869080_n.jpg?oh=cb74a0a6ffb16dcb90e16d832b28b327&oe=58C159E8", height = 100, width = 100),
                                      img(src="https://scontent.xx.fbcdn.net/v/t1.0-1/p50x50/15134712_10209982006780911_4784991390141334730_n.jpg?oh=d55f8c9803e2157e3b6a002b607d08f8&oe=58F4D1E2", height = 100, width = 100),
                                      p("Basketball is one of the many sports where data analytics have become more and more prominent. 
                                      With the vast amount of data now contained by basketball statisticians,
                                      we wanted to look at certain scenarios to see
                                      if there are trends that have been going on for
                                      years, or if the landscape of basketball changes
                                      over time. For this assignment, we got a data
                                      set of the last 10 full nba seasons, and we have
                                      created 3 specific topics of interest we are looking."), 
                                      p("First, we are going to see how important the leading scorer
                                      for a team is.To do this, we created a scatter plot showing
                                      the the average points per game for the leading scorer of each
                                      team, than comparing it to varius efficiency stats,
                                      such as Field Goal Percentage, Effective Field Goal Percentage,
                                      Player Efficiency Rating(PER), etc."), 
                                      p("Secondly, we are going to look at if the successful teams 
                                      are more offensive or defensive oriented, and if that trend 
                                      changes overtime. We are doing this by creating a scatter
                                      plot comparing all the teams offensive and defensive ratings,
                                      and you can use the legend on the right side to decide which
                                      divisions you want to look at."), 
                                      p("Finally, We are looking to see if a player is determined 
                                      to be a quality defender solely based on steals and blocks.
                                      We filtered the data to show only players that have played significant
                                      minutes in games, and the user selects if they want to look into
                                      the blocks or the steals category, and compare that to the Defensive
                                      Box Plus Minus stat, an advanced stat that looks at your stats.
                                      However we can tell the effectiveness of the defender by
                                      the size of each bubble, which is based on the Defensive Win
                                      Shares, an advanced statistic that measures how many wins
                                      a player contributed to his team by his defensive efforts."),
                                      p("Check out more information ",
                                        a("here.", href = "http://www.nba.com")))
                                      
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
                                            choices = list("2006-07" = '2006-07',
                                                           "2007-08" = '2007-08',
                                                           "2008-09" = '2008-09', 
                                                           "2009-10" = '2009-10',
                                                           "2010-11" = '2010-11',
                                                           "2011-12" = '2011-12',
                                                           "2012-13" = '2012-13', 
                                                           "2013-14" = '2013-14',
                                                           "2014-15" = '2014-15',
                                                           "2015-16" = '2015-16'))
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
