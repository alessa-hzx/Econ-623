function [Rdates, returns] = Returns(dates,prices)

% this funciton convert prices dates into return dates, and compute
% continuously compounded returns

% input: price-dates, prices
% output: reutrn-dates, returns

Rdates = dates(2:end);

returns = log(prices(2:end) ./ prices(1:end-1));




end