% Q3

[dates,prices] = loaddata('SP500.csv');
[Rdates, X] = Returns(dates,prices);




theta0 = [0;1];
lb = [-1000;0.00000000000001];
ub = [10000;10000];
options = optimoptions('fmincon','Display','iter','Algorithm','sqp');
[thetahat,fval,exitflag,output] = fmincon('LL_normal',theta0,[],[],[],[],lb,ub,[],options,X)


% compute the sample mean and variance
%smean = mean(X);
%svar = var(X);