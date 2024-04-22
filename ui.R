library(shiny)

ui <- fluidPage(
  titlePanel("mtcars Mileage Comparison"),
  
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput("selectedCars", "Select models to compare milage", 
                         choices = rownames(mtcars), 
                         selected = rownames(mtcars)[c(1,14,18)])
    ),
    mainPanel(
      plotOutput("mpgPlot")
    )
  )
)
