% Q4

% compute the de-meaned returns
[dates,prices] = loaddata('DEXUSEU.csv');
[Rdates, returnsE] = Returns(dates,prices);

Rmean = mean(returnsE);
data = returnsE - Rmean;

% choose theta by using the maximum log-likelihood

theta0 = [0;1;1];
A = [0 1 1; 0 0 0; 0 0 0];
B =  [0.999999999; 0; 0];
lb = [0.00000000000001;0.00000000000001;0.00000000000001];
ub = [10000;10000;10000];
[thetahat,Fvalue] = fmincon('GARCH_LL',theta0,A,B,[],[],lb,ub,[],[],data);

%???????? if alpha=0 then beta=0??

% generate the GARCH variance series applying the theta_hat we got by using
% maximum likelihood

GARCHvol = garch_variance(thetahat, data);

% plot the resulting GARCH variance series
figure(1)
plot(Rdates,GARCHvol)
xlabel('Dates')
ylabel('Volatility')
title('Estimated Variance using GARCH model')
datetick('x','mm/dd/yyyy')


