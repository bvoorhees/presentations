library(tidyverse)
library(tidytext)

#Pandemic
covid_tweets<-en_tweets %>% filter(str_detect(text,'pandemic'))

#Diversity and Inclusion
d_i_tweets<-en_tweets %>% filter(str_detect(text,'diversity|inclusion'))



  