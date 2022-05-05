InitialLoad;

tweetText = tbl.text;
documents = preProcessTweets(tweetText);

vaderScores = vaderSentimentScores(documents);
tbl.vaderScores = vaderScores;

sentimentScore = zeros(size(documents));

wordEmbeddings;

Training;

Testing;

plotResults;

