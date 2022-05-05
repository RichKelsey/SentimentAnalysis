rng("default")
emb = fastTextWordEmbedding;

words = [wordsPositive; wordsNegative];
labels = categorical(nan(numel(words), 1));

labels(1:numel(wordsPositive)) = "Positive";
labels(numel(wordsPositive) + 1 : end) = "Negative";
data = table(words, labels);
data.Properties.VariableNames = ["Word" , "Label"];