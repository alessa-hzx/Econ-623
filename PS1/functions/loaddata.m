function [dates,prices] = loaddata(filename)

% this function load price data 

% input: csv file contains price and dates data
% output: price dates, prices


% first convert datetime into date numbers
dataD = readtable(filename);
str_date = dataD(:,1);
date1 = datenum(str_date{:,:});

% extract the prices
dataR = readmatrix(filename);
prices1 = dataR(:,2);

% pair the prices and dates, then remove NA
dateprices = [date1 prices1];
dateprices(any(isnan(dateprices), 2), :) = [];

% seperate the dates and prices
dates = dateprices(:,1);
prices = dateprices(:,2);


end
