% Q1

% the returns of assets
[dates,prices] = loaddata('NASDAQ100.csv');
[Rdates, returns] = Returns(dates,prices);

% compute squared returns
returns2 = returns .^2;

 

  
 L=20;

% test autocorr between returns
[LBh_r,~,~]=LBtest(returns,L);

% plot the autocorrelation of returns
figure(1)
autocorr(returns,'Numlags',20)
xlabel('Number of Lags')
ylabel('Sample Autocorrelations')
title('Sample Autocorrelation Function of Returns')
legend('Sample Autocorrelation','Confidence Bounds')





% test autocorr between squared-returns
[LBh_sr,~,~]=LBtest(returns2,L);



% plot the autocorrelation of squared-returns
figure(2)
autocorr(returns2,'Numlags',20)
xlabel('Number of Lags')
ylabel('Sample Autocorrelations')
title('Sample Autocorrelation Function of Squared Returns')
legend('Sample Autocorrelation','Confidence Bounds')






