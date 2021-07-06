% Q5

% read data

% first convert datetime into date numbers
dataD = readtable('^GSPC.csv');
str_date = dataD(:,1);
date1 = datenum(str_date{:,:});

% extract the prices
dataR = readmatrix('^GSPC.csv');
prices1 = dataR(:,5); % we use the closed prices

% pair the prices and dates, then remove NA
dateprices = [date1 prices1];
dateprices(any(isnan(dateprices), 2), :) = [];

% seperate the dates and prices
dates = dateprices(:,1);
prices = dateprices(:,2);


% compute daily returns
[Rdates, returns] = Returns(dates,prices);

% a
% assume constant mean, obtain the residuals
mu = mean(returns);
eps = returns - mu;


% b
% estimate a GARCH(1,1) model
Mdl = garch(1,1);
EstMdl = estimate(Mdl,eps);



% construct theta
omega = EstMdl.Constant;
beta = EstMdl.GARCH{1};
alpha = EstMdl.ARCH{1};

theta = [omega;beta;alpha];


% c
% compute the conditional variance
GARCHvol = garch_variance(theta, eps);

% compute the variance as the annualized std
ann_std = sqrt(252 * GARCHvol);

% plot
figure(2)
plot(Rdates,ann_std)
xlabel('Dates')
ylabel('Conditional Standard Deviation')
title('Estimated Conditional Variance using GARCH(1,1) model')
datetick('x','yyyy')


