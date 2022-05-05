function [documents] = preProcessTweets(textData)
cleanTextData = lower(textData);
documents = tokenizedDocument(cleanTextData);
documents = erasePunctuation(documents);
documents = removeStopWords(documents);
end
