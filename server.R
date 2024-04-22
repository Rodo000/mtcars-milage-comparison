library(shiny)
library(ggplot2)

# Server logic for mtcars Mileage Comparison
server <- function(input, output) {
  
  # Reactive expression to get the selected car data
  selectedData <- reactive({
    mtcars[rownames(mtcars) %in% input$selectedCars, ]
  })
  
  # Generate a plot of the selected data
  output$mpgPlot <- renderPlot({
    data <- selectedData()
    ggplot(data, aes(x = rownames(data), y = mpg, fill = rownames(data))) +
      geom_bar(stat = "identity") +
      theme_minimal() +
      theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
      labs(x = "Car Model", y = "Miles per Gallon (mpg)", fill = "Car Model")
  })
}
