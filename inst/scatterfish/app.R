# myFeesh <- function(x, y, z) { # x,y = numeric, z = categorical
#   require(ggplot2)
#
#   df <- data.frame(x,y,z)
#
#   ggplot(data = df, aes(x = x, y = y, colour = z)) +
#     geom_point(cex = 2)
# }

library(shiny, warn.conflicts = FALSE)
library(ggplot2, warn.conflicts = FALSE)

# Define UI for application that draws a histogram
ui <- fluidPage(
  theme = bslib::bs_theme(bootswatch = "darkly"),

  # Application title
  titlePanel("SLR of Chemicals by Group"),

  # Sidebar
  sidebarLayout(
    sidebarPanel(
      varSelectInput("cat", "Group By?",
                     projData[, c("state", "species", "feeder")],
                     selected = "feeder")
    ),

    # Show a plot
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

  output$distPlot <- renderPlot({

      ggplot(data = projData, aes(x = lPCB, y = lMerc, colour = !!input$cat)) +
      geom_point()
  })
}

# Run the application
shinyApp(ui = ui, server = server)
