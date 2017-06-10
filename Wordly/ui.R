#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Word prediction using R"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("selection", "Choose a model:",
                  choices = models),
      textInput("words", "Words", "Thank you for", placeholder = "Type some text"),
      actionButton("update", "Predict!")
    ),
    
    # Show the predicted word
    ## optional: add a wordcloud of the x most likely words
    ## optional: add a likelihood ratio (P-value or whatever we can calculate)
    mainPanel(
       plotOutput("distPlot")
    )
    
    ## include somewhere (on another tab?) general info on the model and myself
    includeMarkdown("wordly.Rmd")
  )
))
