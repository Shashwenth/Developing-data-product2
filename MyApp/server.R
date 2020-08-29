#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$text1 <- renderText(input$temp)
    
    m<-lm(pressure~temperature,data = pressure)
    mp<-reactive({i<-input$temp
    predict(m,newdata=data.frame(temperature=i))})
    
    output$plot1 <- renderPlot({
        i<-input$temp
        plot(pressure$temperature,pressure$pressure,xlim = c(0,360),
             ylim = c(0,1000))
        abline(m,col="red",lwd=2,h=0,v=0)
        points(i,mp(),col="blue",pch=19)
        })
    output$p1<-renderText({mp()})
    
})
