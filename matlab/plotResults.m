figure;
subplot(1,2,1)
scatter(cleanTbl, "timestamp", "modelScore");

subplot(1,2,2)
scatter(cleanTbl, "timestamp", "vaderScores");