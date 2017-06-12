Wordly: a text prediction app in R
========================================================
author: Jaap Balvers
date: 18-06-2017
autosize: true

Goal and source
========================================================

The goal for this project is to create a 'next word' text prediction model in R, based on data analysis of three different datasets:

- blogs
- news
- twitter


Model creation steps
========================================================

First, the text datasets were **cleaned up** with these steps: (1) to lowercase, (2) strip whitespace, (3) remove punctuation (4) remove numbers, (5) convert non-alpabetic characters, (6) remove profanity (source of profane words: <http://www.bannedwordlist.com/>)

Then, **document term matrices** were composed, including a probability based on the relative frequency of word combinations.

A basic **prediction script** processes user-input text and searches through the tables to find the best fitting next word. This script is incorporated in a Shiny App (next slide).


Wordly - a Shiny app
========================================================

I created a small Shiny App on shinyapps.io where users can input some text and get a prediction for the next word. The app is named **'Wordly'**

The app can be found here: <http://shinyapps.io>

The github repo containing all data processing steps is located here: <>

Future improvements
========================================================
Of course there are many improvements possible for a future release, which I unfortunatly didn't have the time to try and implement here. A couple of suggestions:

- Always collect up to 5 predictions, combined from different n-grams and show them all
- Weigh predictions for best match: now the script assumes that all higher-level n-grams are more probable then lower-level n-grams, but that is not always the case
- Make more robust for non-alphabetic input
- Filter out more profanity words
- Output a wordcloud or some other visual form of output for the user
