# next word prediction function for the 'Wordly' project

# uses data from file "n_grams_split.RData" to find a text prediction

wordly <- function(input="try me") {

#######################################
## Input block
#######################################

# input can take the form of a letter to multiple words 
# and words don't have to be correct or even included in the datasets that are availble

# example input
# input <- "thanks for the"

# convert input to usable subset of words
# split into a maximum of last 3 words (for 4-gram)
# and then also into string of last 2 and last 1 word
words <- strsplit(input, " ")[[1]]
l <- length(words)

bi <- words[l]

tri <- words[c(l-1,l)]
  if(length(tri)==2) { 
    tri <- paste(tri[1], tri[2], sep=" ") 
  } else {
    tri <- "null"
  }
  
four <- words[c(l-2,l-1,l)]
  if(length(four)==3) { 
    four <- paste(four[1], four[2], four[3], sep=" ")
  } else {
    four <- "null"
  }  

#######################################
## Search block
#######################################

# use the input text to search through the n-gram datasets and find a predictor
# only search in the n-gram tables if the tri/four variables are not "null" and bi is not "NA"

# only keep the top 5 because any more predictions would not be useful

# For bigrams
if (bi != "NA") {
  birows <- bigram_split$x == bi
  bi_pred <- bigram_split[birows,][1:5,]
} else bi_pred <- "PLACEHOLDER"

# For trigrams
if (tri != "null") {
  trirows <- trigram_split$x == tri
  tri_pred <- trigram_split[trirows,][1:5,]
} else {
  tri_pred <- "PLACEHOLDER"
  #rm("tri_pred") ############## start van een idee: deze variabele verwijderen en dan 
  ## in result straks obv 'exists()' filteren of deze wordt meegenomen
}

# For fourgrams
if (four != "null") {
  fourrows <- fourgram_split$x == four
  four_pred <- fourgram_split[fourrows,][1:5,]
} else {
  four_pred <- "PLACEHOLDER"
  #rm("four_pred") ############## start van een idee: deze variabele verwijderen en dan 
         ## in result straks obv 'exists()' filteren of deze wordt meegenomen
}
#######################################
## Output block
#######################################

# Make a table of the possible predictions that are found and sort probability descending
result <- rbind(bi_pred, tri_pred, four_pred)
result <- result[order(result$prob, decreasing=TRUE),]

##### HIER GEBLEVEN: ALS ER 'placeholder' IN DE PREDICTIONS KOMT, DAN GAAT 
  ## HET MIS OMDAT DE pred KOLOM DAN EEN CHARACTER WORDT
  ## EN HET LIJKT NIET LOGISCH DAT EEN 4-GRAM VOORSPELLING MET LAGE KANS MINDER GOED KLOPT DAN EEN 
  ## BIGRAM VOORSPELLING MET EEN HOGERE KANS - DUS NOG MET EEN VARIABELE MOGELIJK MAKEN OM DIT TE TWEAKEN?
  ## BIJVOORBEELD EEN GEWICHT HANGEN AAN TRI EN FOURGRAMS (EEN VERMENIGVULDIGING?)


# If there is no prediction found, then output something clever:

# output the most probable output word

# optional: output a wordcloud of the x most probable words

result
} ## function end