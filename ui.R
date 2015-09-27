library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  # Application title
  titlePanel("Chicken Feed"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      h3("Introduction"),
      p("This application will predict the size of your chicken if you will tell us the type of feed you use."),
      br(), br(),
      selectInput('feed','Type of feed used', choices=choices, selected=''),
      submitButton('Submit')
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h3('Size Expectation'),
      textOutput('text1'),
      textOutput('text2'),
      textOutput('text3'),
      plotOutput('boxplot'),
      h4('Reference'),
      'McNeil, D. R. (1977)',  em('Interactive Data Analysis'), '. New York: Wiley.'
    )
  )
))
