% Question 4

% b
T = 250;
phi0 = 0;
phi1= 0.8;
L = -1;
U = 1;
theta = [phi0 phi1];

X = AR1_uni(theta,L, U, T);

% plot
figure(4)
plot(1:T,X);
xlabel('Observation')
ylabel('Simulated Data')
title('Simulated AR(1) Process')



% d
T = 1000000;
% i
phi0 = 1;
phi1= 0.8;
L = -5;
U = 2;
theta = [phi0 phi1];
X = AR1_uni(theta,L, U, T);
Xbar = mean(X);
mu = phi0/(1-phi1)+(U+L)/(2 * (1-phi1));

