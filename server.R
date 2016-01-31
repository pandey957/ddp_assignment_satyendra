library(shiny)
library(datasets)

mpgData <- mtcars
mpgData$am <- factor(mpgData$am, labels = c("Automatic", "Manual"))

shinyServer(function(input, output) {

  formulaText_cap <- reactive({
    paste("Coparision between 'mpg ~", input$variable, "'")
  })

  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })

  formulaTextPoint <- reactive({
    paste("mpg ~", "as.integer(", input$variable, ")")
  })

  fit <- reactive({
    lm(as.formula(formulaTextPoint()), data=mpgData)
  })

  output$caption <- renderText({
    formulaText_cap()
  })

  output$mpgBoxPlot <- renderPlot({
    boxplot(as.formula(formulaText()),
            data = mpgData,
            outline = input$outliers)
  })

  output$fit <- renderPrint({
    summary(fit())
  })

  output$mpgPlot <- renderPlot({
    with(mpgData, {
      plot(as.formula(formulaTextPoint()))
      abline(fit(), col=2)
    })
  })

})
