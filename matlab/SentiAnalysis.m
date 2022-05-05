filename = "tweetDataset.csv";
tbl = readtable(filename, "TextType","string");
head(tbl)

str = tbl.text;
documents = tokenizedDocument(str);
documents(1:5)

compoundScores = vaderSentimentScores(documents);
tbl.CompoundScores = compoundScores;
answer = class(compoundScores);
scoreTable = table(Var1,compoundScores);

scatter(datetime(tbl.timestamp, InputFormat="dd/MM/yyyy HH:mm"), tbl.CompoundScores);
