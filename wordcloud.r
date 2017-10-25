lines<-scan('our_God_lyrics.txt',what = character(),sep='\n')
lines_df<-data_frame(line=1:27,text=lines)

Words_df<-lines_df%>%
  unnest_tokens(word,text)

Words_df<-Words_df%>%
  filter(!(word %in% stop_words$word))
  
word_freq<-Words_df%>%
  group_by(word)%>%
  summarise(number = n())


wordcloud(word_freq$word,word_freq$number,colors = brewer.pal(6,'Dark2'))

