words_df<-sns%>%
  unnest_tokens(word,text)
# cleaning
words_df<-words_df%>%
  filter(!(word %in% stop_words$word))


words_freq<-words_df%>%
  group_by(word)%>%
  summarise(word_freq = n())

wordcloud(words_freq$word,words_freq$word_freq,min.freq = 20)

