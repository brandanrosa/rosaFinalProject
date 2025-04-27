# myFeesh2 <- function(x, y) { # x = numeric, y = categorical
#   #require(ggplot2)
#
#   df <- data.frame(x, y)
#
#   ggplot(data = df, aes(x = y, y = x, fill = y)) +
#     geom_boxplot()
# }

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(
  theme = bslib::bs_theme(bootswatch = "darkly"),

    # Application title
    titlePanel("Comparison of Chemicals Across Groups"),

    # Sidebar
    sidebarLayout(
        sidebarPanel(
          varSelectInput("num", "Numeric",
                      projData[, c("lMerc", "lPCB")],
                      selected = "lMerc"),

          varSelectInput("cat", "Categorical",
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

  xx <- reactive(input$num)
  yy <- reactive(input$cat)

    output$distPlot <- renderPlot({

      ggplot(data = projData,
             aes(x = !!input$cat,
                 y = !!input$num,
                 fill = !!input$cat)) +
        geom_boxplot()

      })
}

# Run the application
shinyApp(ui = ui, server = server)
