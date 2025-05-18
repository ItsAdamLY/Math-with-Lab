ab1 = [0 1];
ab2 = [1 2];

f1 = @ (x) -x;
f2 = @ (x) x+2;
x = linspace(0,2*pi,50);

# Case #1
k1 = 3;
[L, Ak, Bk] = FourierConst(k1, f1, f2, ab1, ab2);
fx = SFourier(k1, Ak, Bk, L);
F = function_handle(fx);

subplot(2,2,1)
fplot(F, [x(1) x(end)])
hold on
actual_f = @ (x) (1/2) + sum((2./((1:3)*pi).^2).*cos((1:3)*pi*x));
fplot(actual_f, [x(1), x(end)])
