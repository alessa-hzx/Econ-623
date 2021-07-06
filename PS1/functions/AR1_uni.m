function X = AR1_uni(theta,L, U, T)

% this function simulated the AR1 process with a uniform distributed
% innovation

% input: theta, a vecrtor contains (phi0, phi1); L and U are bondary of the
% uniform distribution; T is the length of the simulated data
% output: X, the simulated AR1 process

X = zeros(T,1);

for t = 2:T
    eps = (U-L).*rand + L; % generate uni-distributed innovation
    X(t) = theta(1)+ theta(2)* X(t-1)+eps;
     
end

end