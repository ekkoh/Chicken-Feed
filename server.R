library(shiny)

# Define server logic required
shinyServer(function(input, output, session) {

  output$text1 <- renderText({
    if (input$feed == '')
      'This application predicts the weight of chicken at six weeks using information on the type of feed they have been given. The results are based on a study to measure and compare the effectiveness of various feed supplements on the growth rate of chickens.'
    else
      paste('You have fed your chickens with ', input$feed)
  })
  output$text2 <- renderText({
    if (input$feed == '')
      ''
    else
    {
      data<-switch(input$feed, 
               'Casein'=chickwtsbyfeed$casein,
               'Horsebean'=chickwtsbyfeed$horsebean,
               'Linseed'=chickwtsbyfeed$linseed, 
               'Meatmeal'=chickwtsbyfeed$meatmeal,
               'Soybean'=chickwtsbyfeed$soybean,
               'Sunflower'=chickwtsbyfeed$sunflower)
      paste('According to our study, the chicks will have average weight ', round(mean(data$weight),3), 'g, standard deviation ', round(sd(data$weight),3), 'g at six weeks')
    }
  })
  output$text3 <- renderText({
    if ( input$feed != '')
      'A boxplot of chick weight using different feed is shown below'
  })
  output$boxplot <- renderPlot({
    if (input$feed != '')
    {
      color<-switch(input$feed, 
                 'Casein'=c('Red', 'Gray', 'Gray', 'Gray', 'Gray', 'Gray'),
                 'Horsebean'=c('Gray', 'Red', 'Gray', 'Gray', 'Gray', 'Gray'),
                 'Linseed'=c('Gray', 'Gray', 'Red', 'Gray', 'Gray', 'Gray'),
                 'Meatmeal'=c('Gray', 'Gray', 'Gray', 'Red', 'Gray', 'Gray'),
                 'Soybean'=c('Gray', 'Gray', 'Gray', 'Gray', 'Red', 'Gray'),
                 'Sunflower'=c('Gray', 'Gray', 'Gray', 'Gray', 'Gray', 'Red'))
      boxplot(chickwts$weight ~ chickwts$feed, col=color)
    }
  })
})
