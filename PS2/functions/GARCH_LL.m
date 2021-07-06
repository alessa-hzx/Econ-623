function garch_llh = GARCH_LL(theta,data)

% this function computes the log-likelihood of variance series based on the
% GARCH (1,1) model of the variance

% Input: theta(omega, beta, alpha); data, demeaned returns which is the
% series of resiudals

% Output: the negative log-likelihood of data given theta

% compute the number of obs of our data
[T,~]=size(data); 
% generate the sigma^2 (T*1)of the distribution of residuals
sig2 = garch_variance(theta, data);


% compute the log-likelihood of residuals, which assumed Gaussian(0,sig^2)
ll=0;
for t = 1: T
    ll =ll+log(1/sqrt(2*pi*sig2(t))*exp(-(data(t))^2/(2*sig2(t))));
    
end

% compute the negative log-likelihood
garch_llh = -ll;


end