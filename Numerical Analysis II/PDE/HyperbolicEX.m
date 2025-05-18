clear, clc;

fV = @(x) 110*sin(pi*x/200);
gV = @(x) 0;

fI = @(x) 5.5*cos(pi*x/200);
gI = @(x) 0;
alp_sq = 0.03;
T = [0, 200];
D = [0, 200];

bv = 0;
h = 10;
k = 0.1;
V = @(x,t) 110*sin(pi*x/200).*cos(pi*t/(200*sqrt(0.03))); # Actual Solution
I = @(x,t) 5.5*cos(pi*x/200).*cos(pi*t/(200*sqrt(0.03)));

W_V = HyperbolicFD(fV, gV, bv, h, k, sqrt(alp_sq), T, D);
W_I = HyperbolicFD(fI, gI, bv, h, k, sqrt(alp_sq), T, D);

xh = D(1):h:D(2);
t = T(1):k:T(2);

tt = 0.2; jt=tt/k+1;
w_V = W_V(jt,:); erv=abs(V(xh,tt)-w_V);
w_I = W_I(jt,:); eri=abs(I(xh,tt)-w_I);

fprintf("Table for values of V\n")
fprintf("       X              Y              W            error\n")
Tab(:,1:2)=[xh;V(xh,tt)]';
Tab(:,3:4)=[w_V;erv]'

subplot(2,2,1)
[X,T] = meshgrid(xh,t);
surf(X,T,W_V);
xlabel('space'), ylabel('time'), zlabel('voltage')

subplot(2,2,3)
[X,T] = meshgrid(xh,t);
surf(X,T,V(X,tt));
xlabel('space'), ylabel('time'), zlabel('voltage')

fprintf("Table for values of I\n")
fprintf("       X              Y              W            error\n")
Tab(:,1:2)=[xh;I(xh,tt)]';
Tab(:,3:4)=[w_I;eri]'

subplot(2,2,2)
surf(X,T,W_I);
xlabel('space'), ylabel('time'), zlabel('current')

subplot(2,2,4)
[X,T] = meshgrid(xh,t);
surf(X,T,I(X,tt));
xlabel('space'), ylabel('time'), zlabel('current')
