# Word Cloud
#https://r-graph-gallery.com/196-the-wordcloud2-library.html
library(wordcloud2)

head(demoFreq)

wordcloud2(data=demoFreq, size=1.6)

wordcloud2(demoFreq, size = 0.7, shape = 'star')

#ggwordcloud-----
#https://cran.r-project.org/web/packages/ggwordcloud/vignettes/ggwordcloud.html
library(ggwordcloud)
data("love_words")
head(love_words)

set.seed(42)
ggplot(love_words_small, aes(label = word)) +  geom_text_wordcloud() +  theme_minimal()

