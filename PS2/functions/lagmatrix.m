function xlag = lagmatrix(X,L,init)

% this function generates a matrix contains L-lagged of time series data X

% Input: X, a time series data; L, number of lags; init, what we feed 
% initial missing values (default 0)

% Output: xlag, the lag matrix

if nargin ==1 
    L = 1; % default value
    init = 0;
elseif nargin == 2
    init = 0;
end


if nargin > 3
    error('mlag: Wrong # of input arguments');
end

[nobs, nvar] = size(X);

xlag = ones(nobs,nvar*L)*init;
icnt = 0;
for i=1:nvar
    for j=1:L
        xlag(j+1:nobs,icnt+j) = X(1:nobs-j,i);
    end
    icnt = icnt+L;
end



end







