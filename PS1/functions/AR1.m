function Y = AR1(theta, T)

% this function estimate data from AR1

% input: theta, contains [phi0, phi1, sig2eps]; T (number of days in our 
% sample)
% output: Y_t (a T*1 vector of simulated data)

% compute the theoretical unconditional mean
mu = theta(1)/(1-theta(2));

Y = [mu zeros(1,T-1)];

for t = 2: T
   eps = sqrt(theta(3)) *randn();
   Y(t) = theta(1) + theta(2) * Y(t-1) + eps;
    
    
end



end