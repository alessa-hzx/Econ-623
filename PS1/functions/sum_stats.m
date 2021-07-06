function [meanX, medianX, maxX, minX, stdX, skeX, kurX, JBHX, JBPX,JBSTAX] = sum_stats(X)

% this function perform summary stats on a time series data
% input: X (a time series data)
% output: mean, median, maximum, minimum, standard deviation, skewness,
% kurtosis, Jarque-Bera test statistics, Jarque-Bera p-value

meanX = mean(X); % compute the mean of X
medianX = median(X); % compute the median of X
maxX = max(X); % compute the maximum of X
minX = min(X); % compute the minimum of X
stdX = std(X); % compute the standard deviation of X
skeX = skewness(X); % compute the skewness of X
kurX = kurtosis(X); % compute the kurtosis of X
[JBHX,JBPX,JBSTAX] = jbtest(X); % compute the JB test stats on X

end







