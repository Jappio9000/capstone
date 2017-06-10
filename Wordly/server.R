library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = 10 + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = 10, col = 'darkgray', border = 'white')
    
  })
  
  ## here's some setup for the model
  
  # get the words
  input$words 
  
  # if there is more than 1 word, get the last 2, 3 or 4 if available.
  # and split so that it can be used in the model
  
  # make a prediction using 4-gram
  
  # test if prediction is strong enough 
  
  # otherwise go to 3-gram and test again
  
  # otherwise go to 2-gram and test again
  
  # and lastly use a placeholder word if no suitable predictions are found
  pred = "OuterWordly!"
  
  
})
