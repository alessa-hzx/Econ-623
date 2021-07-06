function [LBh,LBstat,pvalue]=LBtest(X,L)

% this function performs the Ljung-Box test 

% Input: X (T*N), a time series data; L, a scalar representing the lags

% Output: LBh, the logical value representing the result of the test, (0 do
% not reject, 1 reject) ; LBstat, the LB statistic ; pvalue, the pvalue
% corresponding to this test stat.

[LBh,pvalue,LBstat,~]=lbqtest(X,'Lags',L);



end