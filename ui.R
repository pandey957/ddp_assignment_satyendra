library(shiny)

shinyUI(
  navbarPage("Coursera Assignment for DDP.",
             tabPanel("Analysis",
                      fluidPage(
                        titlePanel("The relationship between variables and miles per gallon (MPG)"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable:",
                                        c("Number of cylinders" = "cyl",
                                          "Displacement (cu.in.)" = "disp",
                                          "Gross horsepower" = "hp",
                                          "Rear axle ratio" = "drat",
                                          "Weight (lb/1000)" = "wt",
                                          "1/4 mile time" = "qsec",
                                          "V/S" = "vs",
                                          "Transmission" = "am",
                                          "Number of forward gears" = "gear",
                                          "Number of carburetors" = "carb"
                                        )),

                            checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                          ),

                          mainPanel(
                            h3(textOutput("caption")),

                            tabsetPanel(type = "tabs",
                                        tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                                        tabPanel("Regression model",
                                                 plotOutput("mpgPlot"),
                                                 verbatimTextOutput("fit")
                                        )
                            )
                          )
                        )
                      )
             ),

             tabPanel("Documentaion for Using this Application",
                      h2("This application shows mpg vs variables mentioned in tab2 of this application."),
                      p("Please select variable from drop down list and visualise the boxplot and also regression line between the selected variable and mpg."),
                      p("Also have provided option to show outliers in boxplot."),
                      p("This application uses mtcars dataset.")
             )

  )
)
