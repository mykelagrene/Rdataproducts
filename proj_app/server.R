library(shiny)
fit1 <- lm(qsec~hp + wt, data = mtcars)

shinyServer(
        function(input, output) {
                output$hp <- renderPrint({input$hp})
                output$wt <- renderPrint({input$wt})
                output$pqsec <- renderPrint({as.numeric(predict(fit1, 
                                data.frame(hp = input$hp, wt = input$wt,
                                interval = "prediction")))})
                }
        )
