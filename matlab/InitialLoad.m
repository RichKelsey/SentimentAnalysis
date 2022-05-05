% clear screen and clear workspace, and Read the positive words
clc
clear
% Read positive words
fidPositive = fopen(fullfile('positive-words.txt'));
% skip comments in the text file
C = textscan(fidPositive,'%s','CommentStyle',';');
% convert cell array C to string 
wordsPositive = string(C{1});
% close files
fclose all;

words_hash = java.util.Hashtable; 

[possize, ~] = size(wordsPositive); % Put all positive words in the hash-table
for ii = 1:possize
 words_hash.put(wordsPositive(ii,1),1);
end

fidNegative = fopen(fullfile('negative-words.txt'));

C = textscan(fidNegative,'%s','CommentStyle',';');
wordsNegative = string(C{1});

filename = "tweetDataset.csv";
tbl = readtable(filename, "TextType","string");

filename = "annotatedTweets.csv";
tblAnnotated = readtable(filename, "TextType","string");