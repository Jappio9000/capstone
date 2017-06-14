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
      #textInput("words", "Try me:", "Enter your text", placeholder = "Type some text"),
      
      textInput("words", "Try me:", "Enter your text", placeholder = "Type some text"),
      
      br(),
      
      # a button for the user to push - this updates the prediction
      actionButton("update", "Predict!"),
      p("Click the button to predict your next word"),
      
      br(),
      
      img(src='wordcloud.png', align = "center")
    ),
    
    # Show the predicted word
    ## optional: add a wordcloud of the x most likely words
    ## optional: add a likelihood ratio (P-value or whatever we can calculate)
    mainPanel(
      tabsetPanel(
        tabPanel("Output", verbatimTextOutput("prediction", placeholder=TRUE)),
        tabPanel("Doc", includeMarkdown("wordly.Rmd")),
        tabPanel("Details", includeMarkdown("details.Rmd")),
        tabPanel("Future", includeMarkdown("future.Rmd")),
        tabPanel("Fun", includeMarkdown("fun.Rmd"))
        #tabPanel("About", aboutMe)
      )
    )#,
    
    ## include somewhere (on another tab?) general info on the model and myself
    #includeMarkdown("wordly.Rmd")
  )
))
