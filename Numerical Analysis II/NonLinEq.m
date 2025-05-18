syms x y yp;

f = (yp)^2/(x^3) - 9*y^2/(x^5) + 4*x;
#f = 4 + (1/4)*x^3 - (y*yp)/8;

fy = diff(f,y); fyp = diff(f,yp);

actual_f = @(x) x^3*log(x);
#actual_f = @(x) (x.^2) + 16./x;

f = function_handle(f,'Vars',[x y yp]);
fy = function_handle(fy,'Vars',[x y yp]);
fyp = function_handle(fyp,'Vars',[x y yp]);

a = 1; b = 2
alp = 0; bet = log(256);

h1 = 0.05; N1 = (b-a)/h1 - 1;
h2 = h1/2; N2 = (b-a)/h2 - 1;
h3 = h2/2; N3 = (b-a)/h3 - 1;

[xh1, uh1] = NonLinShoot([f yp], a, b, alp, bet, h1, 1e-8, 50);

#[xh, uh, actual_f(xh), uh-actual_f(xh)]

plot(xh, uh)
hold on
plot(xh, actual_f(xh), '-o')
hold off
