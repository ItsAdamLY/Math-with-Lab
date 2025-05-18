clc; clear;

f = @(x) cos(pi)*(x-0.5);
alp_sq = 1/pi^2;
T = [0, 1];
D = [0, 1];

bv = 0;
h = 0.1;
k = 0.04;

u = @(x,t) exp(-t).*cos(pi)*(x-0.5); # Actual Solution

W = ParabolicFD(f, bv, h, k, alp_sq, T, D);
W1 = ParabolicCN(f, bv, h, k, alp_sq, T, D);

xh = D(1):h:D(2);
t = T(1):k:T(2);

tt = 0.4; jt=tt/k+1;
w = W(jt,:); er=abs(u(xh,tt)-w);
w1 = W1(jt,:); er1=abs(u(xh,tt)-w1);

Tab(:,1:2)=[xh;u(xh,tt)]';
Tab(:,3:4)=[w;er]';
Tab(:,5:6)=[w1;er]';

fprintf('%5.2f %12.8f %12.8f %14.6e\n', Tab);

subplot(1,2,1)
[X,Y] = meshgrid(xh,t);
mesh(X,Y,W);
subplot(1,2,2)
mesh(X,Y,W1);

xlabel('space'), ylabel('time'), zlabel('temp')

##k = k*20;
##W = ParabolicFD(f, bv, h, k, alp_sq, T, D);
##
##tt = 0.5; jt=tt/k+1;
##w = W(jt,:); er=abs(u(xh,tt)-w);


