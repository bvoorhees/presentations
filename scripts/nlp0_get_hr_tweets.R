library(rtweet)
library(tidyverse)
library(tidytext)

#Authorize twitter using developer app account
#To get an app account visit developer.twitter.com
# store your credentials in R's .Renviron file so you don't expose them in code :)
twitter_token <- create_token(
  app = 'People analytics monitor',
  consumer_key = Sys.getenv("twitter_consumer_key"),
  consumer_secret = Sys.getenv("twitter_consumer_secret"),
  access_token = Sys.getenv("twitter_access_token"),
  access_secret = Sys.getenv("twitter_access_secret"))

#get tweets with hr analytics, people analytics, or hr hashtags
hr_analytics_tweets <- search_tweets(q = "#hranalytics",
                                     n = 10000)

people_analytics_tweets <- search_tweets(q = "#peopleanalytics",
                                         n = 10000)

hr_tweets <- search_tweets(q = "#hr",n = 10000)

#combine into a single dataframe
tweets<-rbind(people_analytics_tweets,hr_analytics_tweets,hr_tweets)

#filter to english
en_tweets<-tweets %>% filter(lang=='en')
