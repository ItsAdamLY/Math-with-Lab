ab1 = [0 1];
ab2 = [1 2];

f1 = @ (x) x;
f2 = @ (x) 2-x;
x = linspace(0,2*pi,50);

# Case #1
k1 = 1;
[L, Ak, Bk] = FourierConst(k1, f1, f2, ab1, ab2);
fx = SFourier(k1, Ak, Bk, L);
F = function_handle(fx);

subplot(2,2,1)
fplot(F, [x(1), x(end)])

# Case #2
k2 = 3;
[L, Ak, Bk] = FourierConst(k2, f1, f2, ab1, ab2);
fx = SFourier(k2, Ak, Bk, L);
F = function_handle(fx);

subplot(2,2,2)
fplot(F, [x(1), x(end)])

# Case #3
k3 = 6;
[L, Ak, Bk] = FourierConst(k3, f1, f2, ab1, ab2);
fx = SFourier(k3, Ak, Bk, L);
F = function_handle(fx);

subplot(2,2,3)
fplot(F, [x(1), x(end)])

# Case #4
k4 = 50;
[L, Ak, Bk] = FourierConst(k4, f1, f2, ab1, ab2);
fx = SFourier(k4, Ak, Bk, L);
F = function_handle(fx);

subplot(2,2,4)
fplot(F, [x(1), x(end)])
