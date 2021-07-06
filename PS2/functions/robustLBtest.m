function [chi2stat,pvalue]=robustLBtest(X,L)

% this function performs robust Ljung-Box test

% Input: X (T*N) a time series data, L, number of lags

% Ouptut: chi2stat, chi^2 statistic for serial correlation; pvalue, the
% p-value corresponding to this test statistics

lagged_data = lagmatrix(X,L,mean(X));

temp = nwest(X(L+1:end),[ones(T-L,1),lagged_data(L+1:end,:)],L+3);
chi2stat = temp.beta(2:end)'*(temp.vcv(2:end,2:end)\temp.beta(2:end));
pvalue = chi2inv(1-0.05,L);



end