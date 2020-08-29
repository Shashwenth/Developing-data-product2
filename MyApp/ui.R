#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/

#

library(shiny)
data("pressure")

# Define UI for application that draws a scatter plot with the predicted value
shinyUI(fluidPage(

    # Application title
    titlePanel("Pressure Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("temp",
                        "Value of Temperature :",
                        min = 100,
                        max = 360,
                        value = 200)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h3("Slider Value:"),
            textOutput("text1"),
            plotOutput("plot1"),
            h3("Predicted Value:"),
            textOutput("p1")
            
            
        )
    )
))
