## This file is for setting global packages, data, etc.

## ADD OTHER PACKAGES ALSO HERE IF NEEDED
# library(wordcloud)

# Get the data into the app
fgram <- load("fourgram.RData")
tgram <- 
bgram <- 
ugram <- 
  
# optional: load the wordcloud PNG files
wctwitter <- load("wordcloud_twitter_clean.png")

# optional: make it possible to use different models to predict the word
# or e.g. use models based on twitter/blogs/news
models <<- list("Model x" = "modelx",
               "Model y" = "modely",
               "Model z" = "modelz")
