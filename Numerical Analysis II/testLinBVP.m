p = @(x) -4./x;
q = @(x) -2./x.^2;
r = @(x) (2./x.^2) .*log(x);

[xh, uh] = LinFinDiff(p, q, r, 1, 2, 1/2, log(2), 0.05)

actual_f = @(x) 4./x - 2./x.^2 + log(x) - 3/2;

plot(xh, uh);
hold on
plot(xh, actual_f(xh));
hold off
