library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Worldy - an next-word prediction app using R"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      #selectInput("selection", "Choose a model:",
      #            choices = models),
      textInput("words", "Words", "Enter your text", placeholder = "Type some text"),
      
      br(),
      
      # a button for the user to push - this updates the prediction
      actionButton("update", "Predict!"),
      p("Click the button to predict your next word")
    ),
    
    # Show the predicted word
    ## optional: add a wordcloud of the x most likely words
    ## optional: add a likelihood ratio (P-value or whatever we can calculate)
    mainPanel(
      verbatimTextOutput("prediction")
    )#,
    
    ## include somewhere (on another tab?) general info on the model and myself
    #includeMarkdown("wordly.Rmd")
  )
))
