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
  checkboxGroupInput("variable", "Average CO2 upatke of plants originated at:(select the checkbox below)",
                     c(
                       "Quebec" = 2,
                       "Mississippi" = 1)),
  
  tableOutput("data"),
mainPanel(
  h4("CO2 dataset:"),
  tableOutput("data1"))
)
