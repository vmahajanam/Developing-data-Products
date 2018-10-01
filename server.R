#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

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


# shinyApp(ui, server)

