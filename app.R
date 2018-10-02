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

