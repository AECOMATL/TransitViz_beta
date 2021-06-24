library("DT")
#library("shinythemes")
library("tidyverse")
#library("shinydashboard")
library("shiny")
library("shinyWidgets")
library("leaflet")
library("rgdal")
library("lubridate")
library('shinymaterial')
library('plotly')


qryde_data <- readRDS("Data/keeperColumns.rds")
countRides <- ((nrow(qryde_data))-1)
#saveRDS(qryde_data, file = "Data/keeperColumns.rds" )

#Replace NA values in funding source column
qryde_data <- qryde_data %>% 
  replace_na(list(FUNDING.SOURCE = "Not Provided"))
  #if(is.na(qryde_data$FUNDING.SOURCE)) qryde_data$FUNDING>SOURCE = "Not Provied"

#Sidebar providder choices
#choice_operatorvar <- qryde_data %>%
 # group_by(OPERATOR) %>%
  #summarise()

server <- 
  function(input, output, session) {
    # output$countPlot <- renderPlot({
    #   if(input$From_date >= input$To_date) return(NULL)
    #   material_spinner_show(session, "countPlot")
    #   Sys.sleep(2.5)
    #   
    #   plot_data <- qryde_data %>%
    #     filter(OPERATOR == input$Operator)
    #            # PURPOSE == input$Purpose,
    #            # DATE >= input$From_date,
    #            # DATE <= input$To_date)
    #   
    #   plot_out <-
    #     ggplot(plot_data, aes(OPERATOR)) +
    #     geom_bar()
    #   
    #   material_spinner_hide(session, "countPlot")
    #   
    #   plot_out
    # })
    output$countPlot <- renderPlot({
      g <- ggplot(qryde_data, aes(OPERATOR)) + geom_bar()
      g
    })
    
    output$countRides <- renderText ({
      countRides
    })
    
    output$summaryTable = DT::renderDataTable(
      qryde_data,
      options = list(scrollX = TRUE)
    )
    
    # observe({
    #   mapLink <- paste0("https://kepler.gl/demo/map?mapUrl=https://dl.dropboxusercontent.com/s/j2ju396w9trduev/keplergl_cgfc6x.json")
    # })
    # output$frame <- renderUI({
    #   od_map <- tags$iframe(src=mapLink, height=1000, width=500)
    #   print(od_map)
    #   od_map
    # })
}
