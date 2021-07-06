% Q2
%options = optimoptions(@fminunc,'Display','iter','Algorithm','quasi-newton');
%[X1,FVAL1,EXITFLAG1,output1]=fminunc(@x3,2,options)

options = optimoptions('fmincon','Display','iter','Algorithm','sqp');
%[X2,FVAL2,EXITFLAG2,output2]=fmincon(@x3,3,[],[],[],[],1,[],[],options)


[X3,FVAL3]=fminunc(@x4,0);


[X4,FVAL4]=fminunc(@x4,1);

figure(3)
fplot(@x4,[-2.5 2.5])
hold on
plot(X4,FVAL4,'*')
hold on
plot(X3,FVAL3,'o')
hold off
xlabel('x')
ylabel('y')
legend('y=f(x)','Min in 2(e)','Min in 2(f)')
text(X4,FVAL4,['(',num2str(X4),',',num2str(FVAL4),')'],'color','b');
text(X3,FVAL3,['(',num2str(X3),',',num2str(FVAL3),')'],'color','b');

