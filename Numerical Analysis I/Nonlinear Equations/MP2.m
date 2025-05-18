clear, clc
warning off

tic
[xi, iter] = mvgnewton(@ (x) eqns(x), [0,0,0], 1e-6, 1e-9, 100)
time1 = toc

tic
[xi, iter] = NewtonMtd(@ (x) eqns(x), [0,0,0], 1e-6, 100)
time2 = toc

x = linspace(-10,10,50);
plot(x, @(x) eqns(x))
