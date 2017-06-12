# next word prediction function for the 'Wordly' project

# uses data from file "n_grams_split.RData" to find a text prediction

wordly <- function(input="try me") {

#######################################
## Input block
#######################################

# input can take the form of a letter to multiple words 
# and words don't have to be correct or even included in the datasets that are availble

# example input
# input <- "what to do" , "waht" (wrong spelling), "WhaT" (caps), "Wha't" (symbols) 

# convert input to usable subset of words
# split into a maximum of last 3 words (for 4-gram)
# and then also into string of last 2 and last 1 word
words <- strsplit(tolower(input), " ")[[1]]
l <- length(words)

#######################################
## Find prediction block
#######################################

# use the input text to search through the n-gram datasets and find a predictor
# first try and find 4-grams, then 3-grams, then 2-grams and finally output some placeholder text

# only keep the top 5 because any more predictions would not be useful

# potential update: if the higher-level n-gram results in <5 predictions: go to next n-gram and add until we reach 5 

if(l>=3) { 
  four <- words[c(l-2,l-1,l)]
  four <- paste(four[1], four[2], four[3], sep=" ")
  fourrows <- fourgram_split$x == four
  predictions <- fourgram_split[fourrows,][1:5,]
  predictions <- predictions[complete.cases(predictions),]
  num_preds <- nrow(predictions[complete.cases(predictions),])
} 

if (l==2 | num_preds==0) {
  tri <- words[c(l-1,l)]
  tri <- paste(tri[1], tri[2], sep=" ") 
  trirows <- trigram_split$x == tri
  predictions <- trigram_split[trirows,][1:5,]
  predictions <- predictions[complete.cases(predictions),]
  num_preds <- nrow(predictions[complete.cases(predictions),])
}  

if (l==1 | num_preds==0) {
  bi <- words[l]
  birows <- bigram_split$x == bi
  predictions <- bigram_split[birows,][1:5,]
  predictions <- predictions[complete.cases(predictions),]
  num_preds <- nrow(predictions[complete.cases(predictions),])
} 

# for when not a single word is entered
if (l == 0) {
 predictions = "please enter one or more words"
}

if (num_preds==0) {
  predictions = "sorry! no suitable word found"
} 
# predictions[complete.cases(predictions),]
predictions

#######################################
## Output block
#######################################

# Make a table of the possible predictions that are found and sort probability descending
#result <- rbind(bi_pred, tri_pred, four_pred)
#result <- result[order(result$prob, decreasing=TRUE),]

##### HIER GEBLEVEN: ALS ER 'placeholder' IN DE PREDICTIONS KOMT, DAN GAAT 
  ## HET MIS OMDAT DE pred KOLOM DAN EEN CHARACTER WORDT
  ## EN HET LIJKT NIET LOGISCH DAT EEN 4-GRAM VOORSPELLING MET LAGE KANS MINDER GOED KLOPT DAN EEN 
  ## BIGRAM VOORSPELLING MET EEN HOGERE KANS - DUS NOG MET EEN VARIABELE MOGELIJK MAKEN OM DIT TE TWEAKEN?
  ## BIJVOORBEELD EEN GEWICHT HANGEN AAN TRI EN FOURGRAMS (EEN VERMENIGVULDIGING?)


# If there is no prediction found, then output something clever:

# output the most probable output word

# optional: output a wordcloud of the x most probable words

#result
} ## function end