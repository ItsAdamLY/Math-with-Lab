clc; clear;

f = @(x) sin(pi*x);
alp_sq = 1;
T = [0, 0.5];
D = [0, 1];

bv = 0;
h = 0.1;
k = 0.01;

u = @(x,t) exp(-pi^2*t)*sin(pi*x); # Actual Solution

W = ParabolicBD(f, bv, h, k, alp_sq, T, D);

xh = D(1):h:D(2);
t = T(1):k:T(2);

tt = 0.5; jt=tt/k+1;
w = W(jt,:); er=abs(u(xh,tt)-w);

Tab(:,1:2)=[xh;u(xh,tt)]';
Tab(:,3:4)=[w;er]';

subplot(1,2,1)
[X,Y] = meshgrid(xh,t);
mesh(X,Y,W);
xlabel('space'), ylabel('time'), zlabel('temp')


##k = k*20;
##W = ParabolicFD(f, bv, h, k, alp_sq, T, D);
##
##tt = 0.5; jt=tt/k+1;
##w = W(jt,:); er=abs(u(xh,tt)-w);


