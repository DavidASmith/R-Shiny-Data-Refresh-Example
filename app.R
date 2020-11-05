library(shiny)

# Define UI
ui <- fluidPage(
    # Application title
    titlePanel("Demonstration of Data Refresh in R Shiny"),
    # Outputs
    textOutput(outputId = "datetime"), 
    textOutput(outputId = "time")
)

# Define server logic
server <- function(input, output) {
    # Get full date and time
    get_full_datetime <- reactive({
        # Refresh every 5 seconds
        invalidateLater(5000)
        as.character(Sys.time())
    })
    # Get just the time
    get_time <- reactive({
        # Refresh every second
        invalidateLater(1000)
        format(Sys.time(), "%H:%M:%S")
    })
    # Render outputs
    output$datetime <- renderText({get_full_datetime()})
    output$time <- renderText({get_time()})
}

# Run the application 
shinyApp(ui = ui, server = server)
