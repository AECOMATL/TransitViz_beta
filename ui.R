#library('shinythemes')
library('tidyverse')
library('shiny')
library('shinyWidgets')
library('leaflet')
library('shinyjs')
library('DT')
library('shinymaterial')

#qryde_data <- read.csv("Data/keeperColumns.csv", stringsAsFactors = FALSE)
#count <- ((nrow(qryde_data))-1)
#saveRDS(qryde_data, file = "Data/keeperColumns.rds" )


# Wrap shinymaterial apps in material_page
ui <- material_page(
  title = "TransitViz",
  primary_theme_color = "#256194", 
  secondary_theme_color = "#DEA128",

  # Define tabs
  material_tabs(
    tabs = c(
      "Dashboard" = "dashboard",
      "Map" = "map",
      "OD Map" = "odMap",
      "Reporting" = "reporting"
    )
  ),
 ### Define tab content ###
  
  material_tab_content(
    tab_id = "dashboard",
    tags$h4("Overview of Qryde Data"),
    tags$br(),
    
    ###COUNTS CARD
    material_row (
      material_column(
        width = 6,
        offset = 1, 
        material_card(
          title =
            "Count of Rides",
          h5 (textOutput("countRides"))
        )
      )
    ),
    
    
    ###PLOT of COUNTS by OPERATOR
    material_row(
      material_column(
        width = 6,
        offset = 1, 
        material_dropdown(
          input_id = "Operator",
          label = "Operator",
          choices = sort(unique(qryde_data$OPERATOR)),
          color = "#DEA128"
        )
      ),
      # material_column(
      #   width = 6,
      #   material_dropdown(
      #     input_id = "Purpose",
      #     label = "Purpose",
      #     choices = sort(unique(qryde_data$PURPOSE)),
      #     color = "#DEA128"
      #   )
      # ),
      # material_column(
      #   width = 3,
      #   material_slider(
      #     input_id = "From_date",
      #     label = "From Date",
      #     min_value = "2020-01-01",
      #     max_value = max(qryde_data$DATE),
      #     initial_value = "2020-01-01",
      #     color = "#DEA128"
      #   )
      # ),
      # material_column(
      #   width = 3,
      #   material_slider(
      #     input_id = "To_date",
      #     label = "To Date",
      #     min_value = "2020-01-01",
      #     max_value = max(qryde_data$DATE),
      #     initial_value = "2020-06-01",
      #     color = "#DEA128"
      #   )
      # ),
    ),
    material_row(
     material_column(
       width = 10,
       offset = 1, 
       material_card(
         title = 
           "Total Rides by Operator",
         plotOutput("countPlot"),
         uiOutput("count_plot_error")
       )
     ) 
    ),
    material_row(
      material_column(
        width = 10,
        offset = 1, 
        material_card(
          title = 
            "Summary Table",
          DT::dataTableOutput("summaryTable")
        )
      ) 
    ),
  ),
 
  material_tab_content(
    tab_id = "map",
    tags$h4("Map"),
    material_row(
      material_column(
        width = 10,
        offset = 1, 
        material_card(
          title = 
            "Map Descriptor",
            p("insert code of map from previous build"),
            br(),
            br(),
            br()
        )
      ) 
    ),
  ),
 
 
 ###############
 ### OD MAP ###
 #############
  material_tab_content(
    tab_id = "odMap",
    tags$h4("Origins and Destiantions Map"),
    material_row(
      material_column(
        width = 8,
        offset = 1,
         material_card(
           title = "OD and Kepler Map",
           # htmlOutput(frame)
           a("Click to view OD MAP", href="https://kepler.gl/demo/map?mapUrl=https://dl.dropboxusercontent.com/s/j2ju396w9trduev/keplergl_cgfc6x.json", target="_blank" )
         )
       )
    ),
  ),
  material_tab_content(
    tab_id = "reporting",
    tags$h4("Prepare Reports to Export"),
    material_row(
      material_column(
        width = 10,
        offset = 1,
        material_card(
          title = "Reporting",
          a("Link to how to begin building out this page", href="https://shiny.rstudio.com/articles/generating-reports.html", target="_blank")
          
        )
      )
    ),
  )
)

