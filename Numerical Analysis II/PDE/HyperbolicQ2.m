clc; clear;

f = @(x) 0;
g = @(x) sin(4*pi*x);
alp = 1/(4*pi);
T = [0, 0.5];
D = [0, 0.5];

bv = 0;

M = 4;
N = 4;

h = (D(2)-D(1))/(M-1);
k = (T(2)-T(1))/(N-1);

u = @(x,t) sin(t)*sin(4*pi*x); # Actual Solution

W = HyperbolicFD(f, g, bv, h, k, alp, T, D);

xh = D(1):h:D(2);
t = T(1):k:T(2);

tt = 0.5; jt=tt/k+1;
w = W(jt,:); er=abs(u(xh,tt)-w);

Tab(:,1:2)=[xh;u(xh,tt)]';
Tab(:,3:4)=[w;er]';

#fprintf('%5.2f %12.8f %12.8f %14.6e\n', Tab);

#subplot(1,2,1)
[X,Y] = meshgrid(xh,t);
mesh(X,Y,W);
xlabel('space'), ylabel('time'), zlabel('temp')

##k = k*20;
##W = ParabolicFD(f, bv, h, k, alp_sq, T, D);
##
##tt = 0.5; jt=tt/k+1;
##w = W(jt,:); er=abs(u(xh,tt)-w);


