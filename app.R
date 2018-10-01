#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that displays average CO2 uptake by place of plant origin

fluidPage(
  checkboxGroupInput("variable", "Average CO2 upatke of plants originated at:(select the checkbox to display)",
                     c(
                       "Quebec" = 2,
                       "Mississippi" = 1)),
  
  tableOutput("data"),
  mainPanel(
    h4("CO2 dataset:"),
    tableOutput("data1"))
)

   
   # Application title
titlePanel("Average CO2 uptake of grass plants")
   
library(shiny)

function(input, output,session) {
  CO2data <- read.csv("./CO2.csv")
  nrowsofCO2 = nrow(CO2data)
  ncolsofCO2 = ncol(CO2data)
  uptakeByPltOrigin <- round(tapply(CO2data$uptake, CO2data$Type, mean),2)
  uptakeByPltOrigin <- as.data.frame(uptakeByPltOrigin)
  output$data <- renderTable({
    uptakeByPltOrigin[as.numeric(input$variable),1]
  }, rownames = FALSE, colnames=FALSE)
  
  
  output$data1 <- renderTable({CO2data},rownames = FALSE, colnames=TRUE)
}

# Run the application 
shinyApp(ui = ui, server = server)

