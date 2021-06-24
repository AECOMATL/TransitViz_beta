ui <- navbarPage("TransitViz", theme = shinytheme("flatly"),
                 #DASHBOARD Page
                 tabPanel("Overview",
                          h2("Overview of GA Transit Trips"),
                          br(),
                          fluidRow(
                            valueBoxOutput("countBox"),
                            valueBox(10 * 2, "New Orders", icon = icon("credit-card"), color= "aqua")
                          )
                 ),
                 #FILTER MAP Page
                 tabPanel("Filter Map",
                          sidebarLayout(
                            sidebarPanel(
                              h4("Create maps using the filters below"),
                              useShinyjs(),
                              div(
                                id = "form",
                                br(),
                                uiOutput("select_datevar"),
                                uiOutput("select_operatorvar"),
                                uiOutput("select_fundingvar"),
                                actionButton("submit", "Submit"),
                                actionButton("reset", "Reset")
                                
                              )
                            ),
                            mainPanel(
                              h2("QRYDE Data Explorer"),
                              leafletOutput("map", height = "90vh"),
                              plotOutput("circles"),
                              p()
                            )
                          )
                 ),
                 tabPanel("O&D Map",
                          h2("O&D tab")
                 ),
                 tabPanel("Reporting",
                          h2("Reporting Tab")
                 )
)




