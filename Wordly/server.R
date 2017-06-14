library(shiny)

source("wordly_script.R") # the prediction script loads the 'wordly()' function
#load("data/wordly_data.RData") # the prediction data needed in the script

#try with explicit object loading
load("data/bigram.RData", envir=.GlobalEnv)
load("data/trigram.RData", envir=.GlobalEnv)
load("data/fourgram.RData", envir=.GlobalEnv)

#source("wordly.Rmd") # documentation for the app (possibly on another tab)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  # this links to the 'update' button of the app
  prediction <- eventReactive(input$update, {
    
    wordly(input=input$words)
    #wordly(input=input$words)[1,2]
    #input$words
    
    #strsplit(tolower(input$words), " ")[[1]]
    
  })
  
  ####################################
  #### HIER GEBLEVEN MET HET BOUWEN - HIJ LOOPT VAST OP DE OUTPUT
  #### WANT NU MET [1,2] PAKT HIJ WEL DE EERSTE VOORSPELLING
  #### MAAR ALLEEN ALS ER EEN VOORSPELLING IS.... ANDERS IS HET GEEN TABEL MAAR EEN STRING (ZIE SCRIPT)
  ####################################
  
  
  # in the final app, use renderText to only output the most likely word
  output$prediction <- renderText ({
  #output$prediction <- tableOutput({
    # get the words
    prediction()
  })
  

})


## demo of actionbutton:https://shiny.rstudio.com/gallery/actionbutton-demo.html
