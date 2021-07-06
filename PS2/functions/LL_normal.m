function n_llN = LL_normal(theta,X)

% this function compute the negative log-likelihood of a univariate normal
% random variable

% Input: theta, (2*1) containing the mean and variance of the normal distribution;
% X, the vector of data

% Output: the negative log-likelihood

[T,~]=size(X); % number of obs of our data
ll=0;
for i = 1: T
    ll =ll+log(1/sqrt(2*pi*theta(2))*exp(-(X(i)-theta(1))^2/(2*theta(2))));
    
end

n_llN = -ll;

end