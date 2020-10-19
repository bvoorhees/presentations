library(tidyverse)
library(tidytext)

#All data

all_bigrams <-en_tweets %>% 
  mutate(text=gsub('http\\S+','',text)) %>% #strip out links
  mutate(text=gsub('\\#\\S+','',text)) %>%#strip out hash tags
  mutate(text=gsub('\\@\\S+','',text)) %>%#strip out user tags
  mutate(text=gsub('[&gt;]+','',text)) %>%# strip out certain symbols from non-US keyboards
  mutate(text=gsub('([0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]','',text)) %>%#strip out time 
  filter(is_retweet==F & is_quote==F) %>% # original tweets only (no quotes or re-tweets)
  unnest_tokens(bigram,text,token='ngrams',n=2,collapse = F,drop=F) %>% #get bi-grams 
  separate(bigram, c("word1", "word2"), sep = " ") %>% 
  filter(!word1 %in% stop_words$word) %>% #remove stop words from bi-grams 
  filter(!word2 %in% stop_words$word) %>% #remove stop words from bi-grams 
  unite(bigram,word1,word2,sep=' ') %>% 
  group_by(bigram) %>% 
  summarise(mentions=n()) %>% #count bi-grams 
  arrange(-mentions)

#Pandemic - related posts

covid_words_to_exclude<-c('covid','19','pandemic')

covid_bigrams <-covid_tweets %>% 
  mutate(text=gsub('http\\S+','',text)) %>% #strip out links
  mutate(text=gsub('\\#\\S+','',text)) %>%#strip out hash tags
  mutate(text=gsub('\\@\\S+','',text)) %>%#strip out user tags
  mutate(text=gsub('([0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]','',text)) %>%#strip out time 
  filter(is_retweet==F & is_quote==F) %>% # original tweets only (no quotes or re-tweets)
  unnest_tokens(bigram,text,token='ngrams',n=2,collapse = F,drop=F) %>% #get bi-grams 
  separate(bigram, c("word1", "word2"), sep = " ") %>% 
  filter(!word1 %in% c(stop_words$word,covid_words_to_exclude)) %>% #remove stop words from bi-grams 
  filter(!word2 %in% c(stop_words$word,covid_words_to_exclude)) %>% #remove stop words from bi-grams 
  unite(bigram,word1,word2,sep=' ') %>% 
  group_by(bigram) %>% 
  summarise(mentions=n()) %>% #count bi-grams 
  arrange(-mentions)

#Diversity and Inclusion

d_i_bigrams <-d_i_tweets %>% 
  mutate(text=gsub('http\\S+','',text)) %>% #strip out links
  mutate(text=gsub('\\#\\S+','',text)) %>% #strip out hash tags
  mutate(text=gsub('\\@\\S+','',text)) %>% #strip out user tags
  mutate(text=gsub('([0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]','',text)) %>% #strip out time 
  filter(is_retweet==F & is_quote==F) %>% #original tweets only (no quotes or re-tweets)
  unnest_tokens(bigram,text,token='ngrams',n=2,collapse = F,drop=F) %>% #get bi-grams 
  separate(bigram, c("word1", "word2"), sep = " ") %>% 
  filter(!word1 %in% stop_words$word) %>% #remove stop words from bi-grams 
  filter(!word2 %in% stop_words$word) %>% #remove stop words from bi-grams 
  unite(bigram,word1,word2,sep=' ') %>% 
  group_by(bigram) %>% 
  summarise(mentions=n()) %>% #count bi-grams 
  arrange(-mentions)

#Diversity and Inclusion

p_a_bigrams <-p_a_tweets %>% 
  mutate(text=gsub('http\\S+','',text)) %>% #strip out links
  mutate(text=gsub('\\#\\S+','',text)) %>% #strip out hash tags
  mutate(text=gsub('\\@\\S+','',text)) %>% #strip out user tags
  mutate(text=gsub('([0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]','',text)) %>% #strip out time 
  filter(is_retweet==F & is_quote==F) %>% #original tweets only (no quotes or re-tweets)
  unnest_tokens(bigram,text,token='ngrams',n=2,collapse = F,drop=F) %>% #get bi-grams 
  separate(bigram, c("word1", "word2"), sep = " ") %>% 
  filter(!word1 %in% stop_words$word) %>% #remove stop words from bi-grams 
  filter(!word2 %in% stop_words$word) %>% #remove stop words from bi-grams 
  unite(bigram,word1,word2,sep=' ') %>% 
  filter(bigram!='people analytics') %>% 
  group_by(bigram) %>% 
  summarise(mentions=n()) %>% #count bi-grams 
  arrange(-mentions)