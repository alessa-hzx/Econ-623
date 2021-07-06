% Question 1

% a
% load the data 

[datesE,pricesE] = loaddata("DEXUSEU.csv");
[datesS,pricesS] = loaddata('SP500.csv');

% and convert prices into returns
[RdatesE, returnsE] = Returns(datesE,pricesE);
[RdatesS, returnsS] = Returns(datesS,pricesS);


% plot EXR
figure(1)
plot(RdatesE,returnsE);
xlabel('Date')
ylabel('Return')
datetick('x','mm/dd/yy')
title('Returns of the U.S./Euro Foreign Exchange Rate')

% plot sp500
figure(2)
plot(RdatesS,returnsS);
xlabel('Date')
ylabel('Return')
datetick('x','mm/dd/yy')
title('Returns of the S&P500')




% b
% data from the SP500
[meanX, medianX, maxX, minX, stdX, skeX, kurX, JBHX, JBPX,JBSTAX] = sum_stats(returnsS);

% data from exchange rate
[meanY, medianY, maxY, minY, stdY, skeY, kurY, JBHY, JBPY,JBSTAY] = sum_stats(returnsE);


