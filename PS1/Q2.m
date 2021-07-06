% Question 2

% a 

% merge two dataset with respect to dates
rE = [RdatesE returnsE];
rS = [RdatesS returnsS];

[~,i,j] = intersect(rE(:,1),rS(:,1));
XY = [rE(i,:) rS(j,2)];



% Y_t (t>1) Y is the returns of EXR
Y = XY(:,2);
Yt = Y(2:end); 
% X_t-1 X is the returns of SP500
X = XY(:,3);
Xt = X(1:end-1);
% OLS regression
reg = fitlm(Xt,Yt);
display(reg)

% b 
beta_hat = table2array(reg.Coefficients(:,1));
SE = table2array(reg.Coefficients(:,2));

beta1_hat = beta_hat(2);
beta1_se = SE(2);

tstat = (beta1_hat-1)/beta1_se;


% c
% y_t (t>3)
yt = Y(4:end);
% x_t-3
xt3 = X(1:end-3);
% x_t-2
xt2 = X(2:end-2);
% x_t-1
xt1 = X(3:end-1);

xt = [xt1 xt2 xt3];
% OLS regression
reg1 = fitlm(xt,yt);
display(reg1)

% d
B = table2array(reg1.Coefficients(:,1));
beta_hats = B(2:end);
b = [0;0;0];
V = reg1.CoefficientCovariance;
V_beta = V(2:end,2:end);

R = [1 0 0; 0 1 0; 0 0 1];

Test = (R*beta_hats - b)'*inv(R*V_beta*R')*(R*beta_hats - b);
% e
R1 = [1 -1 0; 0 1 -1];
b1 = [0;0];

Test1 = (R1*beta_hats - b1)'*inv(R1*V_beta*R1')*(R1*beta_hats - b1);

