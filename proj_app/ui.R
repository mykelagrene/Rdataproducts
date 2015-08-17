library(shiny)

shinyUI(pageWithSidebar(
        headerPanel("Predict Vehicle 1/4 Mile Time"),
        sidebarPanel(
                h3('Instructions:'),
                h5('1. Select desired HP and Weight values.'),
                h5('2. Press Submit.'),
                sliderInput('hp', 'Gross HP',value = 150, min = 100, max = 400, 
                            step = 10),
                sliderInput('wt', 'Weight (lbs/1000)',value = 2, min = 1.5, 
                            max = 4, step = 0.5),
                submitButton('Submit')
        ),
        mainPanel(
                tabsetPanel(
                        tabPanel("Results",
                                 h3('Results of Prediction:'),
                                 h4('Horsepower'),
                                 verbatimTextOutput("hp"),
                                 h4('Weight/1000lbs'),
                                 verbatimTextOutput("wt"),
                                 h4('Predicted 1/4 mile time (sec)'),
                                 verbatimTextOutput("pqsec")),
                        tabPanel("About",
                                 h4('This app fits a linear model predictor for quarter mile time using gross vehicle weight and horsepower variables from the mtcars data set.'),
                                h4('When the user provides their own vehicle weight and horsepower, the app uses these values against the linear model to predict quarter mile time.'))
                )
        )
))