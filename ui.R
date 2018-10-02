#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
# Define UI for application that displays average CO2 uptake by place of plant origin

fluidPage(

  h4("------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"),
  
  h4("This App gives you the mean CO2 uptake of grass plants based on their origin. The data comes from observations of an experiment conducted on grass plants. You need to select the checkbox below to get the mean CO2 uptake of plants originating from that region"),
  h4("------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"),
  
  checkboxGroupInput("variable", "select the checkbox",
                     c(
                       "Quebec" = 2,
                       "Mississippi" = 1)),
  
  tableOutput("data"),
  h4("Note:"),
  h5("The entire observations from this experiment are provided below as CO2 dataset. The column 'Type' represents the origin of the plant. The last column 'uptake' represents the CO2 uptake"),
  h5("For more details on CO2 dataset please click the link to ",a("My presentation on reproducible pitch of this app", href="http://rpubs.com/vmahajanam/CO2App-Rep-Pitch")),
  mainPanel(
  h6("CO2 dataset contents:"),
  tableOutput("data1"))

)
