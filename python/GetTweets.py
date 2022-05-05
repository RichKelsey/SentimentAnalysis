import tweepy
import pandas
from cgitb import text
from unittest import result
from config import *

import datetime

auth = tweepy.OAuthHandler(TWITTER_CONSUMER_KEY, TWITTER_CONSUMER_SECRET)
auth.set_access_token(TWITTER_ACCESS_TOKEN, TWITTER_ACCESS_TOKEN_SECRET)

api = tweepy.API(auth, wait_on_rate_limit = True)

tweetSearch = tweepy.Cursor(api.search_tweets, q="Elon Musk -filter:retweets", tweet_mode="extended", lang='en', result_type="mixed").items()


results = []
num = 1

for tweet in tweetSearch:
    
    tweetText = tweet._json["full_text"]
    print(tweetText)
    print(num)
    likeCount = tweet.favorite_count
    retweetCount = tweet.retweet_count
    timestamp = tweet.created_at

    abstractedInfo = {"text": tweetText, "likeCount" : likeCount, "retweetCount" : retweetCount, "timestamp" : timestamp}
    results.append(abstractedInfo)
    num += 1
    if num == 50000:
        break


dataset = pandas.DataFrame(results)
dataset.to_csv("tweetDataset50k.csv")