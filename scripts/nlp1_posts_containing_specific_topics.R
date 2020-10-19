library(tidyverse)
library(tidytext)

#Pandemic
covid_tweets<-en_tweets %>% filter(str_detect(text,'pandemic'))

#Diversity and Inclusion
d_i_tweets<-en_tweets %>% filter(str_detect(text,'diversity|inclusion'))

#People Analytics
p_a_tweets<-en_tweets %>% filter(str_detect(text,'People Analytics'))


  