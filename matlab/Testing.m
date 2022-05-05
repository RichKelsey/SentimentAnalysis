for i = 1:numel(documents)
    words = string(documents(i));
    vec = word2vec(emb,words);
    [~,scores] = predict(model,vec);
    sentimentScore(i) = mean(scores(:,1));
end

tbl.modelScore = sentimentScore;

cleanTbl = rmmissing(tbl);

