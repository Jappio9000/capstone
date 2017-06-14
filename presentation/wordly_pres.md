Wordly: a text prediction app in R
========================================================
author: Jaap Balvers
date: 14-06-2017
autosize: true

Q: Can a machine predict what I'm going to say?

A: Sure, let's demonstrate that in this project!

Goal
========================================================

The goal for this project is to create a 'next word' text prediction model in R, based on data analysis of three different datasets with texts from three different sources:

- blogs
- news
- twitter

All datasets are about 200Mb large and can be downloaded [from here](https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip)

The form of data science used in the project is called Natural Language Processing (NLP).

Model creation steps
========================================================
<small>
First, the text datasets were **cleaned up** with these steps: (1) to lowercase, (2) strip whitespace, (3) remove punctuation (4) remove numbers, (5) convert non-alpabetic characters, (6) remove profanity (from [bannedwordlist.com](http://www.bannedwordlist.com/))

Next was the **exploratory analysis** phase, where I checked the data content and viewed it in different ways (e.g. histogram, wordcloud, document term matrices) to formulate a method for modelling. 

Then, **n-gram tables** were composed for 2 to 4-grams. The n-1 words preceding the last word predict what the next word will be. The frequency that certain word combinations are found in the source data can be translated to aprobability that the predicted word will be the next one typed.

A basic **prediction script** processes user-input text and searches through the n-gram tables to find the best fitting next word. It searches in higher-level n-grams first and 'drills down' to smaller n-grams if no match is found. Finally if not a single match is found, the user will get a standard response from the script.
</small>

Wordly - a Shiny app
========================================================
<small>
I created a small Shiny App on shinyapps.io where users can input some text and get a prediction for the next word. The app uses the models and the prediction script created for this project and is named **'Wordly'**

The app can be found on [ShinyApps.io](https://jappio9000.shinyapps.io/Wordly/)

The github repo containing all data processing steps is [located here](https://github.com/Jappio9000/capstone>)

Of course, the app is very basic at this point and I hope to add a number of features, for example the output of a wordcloud or some other visual form of output for the user.
</small>

Future improvements
========================================================
<small>
Of course there are many improvements possible for a future release, which I unfortunatly didn't have the time to try and implement here. A couple of suggestions:

- Always collect up to 5 predictions, combined from different n-grams and show them all
- Weigh predictions for best match: now the script assumes that all higher-level n-grams are more probable then lower-level n-grams, but that is not always the case
- Make more robust for non-alphabetic input
- Filter out more profanity words
- Use a more comprehensive dataset to build the model
- Use a specific dataset for a specific type of user: e.g. a text prediction app for scientists probably needs other models than an app for children
</small>
