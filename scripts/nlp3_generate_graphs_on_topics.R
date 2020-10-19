library(tidyverse)

#Pandemic
all_topics_chart<-all_bigrams[1:10,] %>% 
  ggplot(aes(x=mentions,y=reorder(bigram,mentions))) +
  geom_bar(stat='identity',fill='#027A71')+
  ggtitle("Top topics on #HR Twitter",subtitle = paste0("Tweets from ",
                                                                                            as.Date(min(d_i_tweets$created_at)),
                                                                                            ' to ',
                                                                                            as.Date(max(d_i_tweets$created_at))))+
  xlab('Number of Mentions')+
  ylab('Two-word Phrase')


#Pandemic
covid_chart<-covid_bigrams[1:10,] %>% 
  ggplot(aes(x=mentions,y=reorder(bigram,mentions))) +
  geom_bar(stat='identity',fill='#027A71')+
  ggtitle("Top topics surrounding COVID-19 on #HR Twitter",subtitle = paste0("Tweets from ",
                                                                                            as.Date(min(d_i_tweets$created_at)),
                                                                                            ' to ',
                                                                                            as.Date(max(d_i_tweets$created_at))))+
  xlab('Number of Mentions')+
  ylab('Two-word Phrase')


#Diversity and Inclusion
d_i_chart<-d_i_bigrams[1:10,] %>% 
  ggplot(aes(x=mentions,y=reorder(bigram,mentions))) +
  geom_bar(stat='identity',fill='#027A71')+
  ggtitle("Top topics surrounding Diversity and Inclusion on #HR Twitter",subtitle = paste0("Tweets from ",
                                                                             as.Date(min(d_i_tweets$created_at)),
                                                                             ' to ',
                                                                             as.Date(max(d_i_tweets$created_at))))+
  xlab('Number of Mentions')+
  ylab('Two-word Phrase')
