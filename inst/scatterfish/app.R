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
      varSelectInput("num1", "Response",
                     data[, c("amtMERC", "amtPCB", "amtPFA")],
                     selected = "amtMerc"),

      varSelectInput("num2", "Explanatory",
                     data[, c("amtMERC", "amtPCB", "amtPFA")],
                     selected = "amtPCB"),

      varSelectInput("cat", "Categorical",
                     data[, c("state", "species", "feeder")],
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

  # xx <- reactive(input$num1)
  # yy <- reactive(input$num1)
  # zz <- reactive(input$cat)
  # ylm <- reactive(lm(input$num1 ~ input$num2, data = data))

  output$distPlot <- renderPlot({

      ggplot(data = data, aes(x = !!input$num2, y = !!input$num1, colour = !!input$cat)) +
      geom_point()
  })
}

# Run the application
shinyApp(ui = ui, server = server)
