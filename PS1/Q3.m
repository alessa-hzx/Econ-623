% Question 3

% a

T = 250;
phi0 = 0;
phi1 = 0.8;
sig2eps = 1;
theta = [phi0,phi1,sig2eps];

Y = AR1(theta, T);

seed = 3005;
rng(seed,'twister');

% b
% plot Y_t
figure(1)
plot(1:T,Y);
xlabel('Days')
ylabel('Y')  
title('Simulated Data from AR(1) Process')


% c

% theoretical autocorrelations
trho = zeros(1,20);
for i = 1:20
   trho(i) = phi1^i; 
    
end
    



% plot
figure(2)
plot(1:20,trho);
hold on
autocorr(Y,'Numlags',20)
hold off
xlabel('Number of Lags')
ylabel('Autocorrelations') 
title('Sample and Theoreticall Autocorrelations')
legend('theoreticall autocorr','sample autocorr')



