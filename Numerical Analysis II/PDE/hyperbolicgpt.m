f = @(x) 5.5 * sin(pi * x / 200);
g = @(x) 0;
alp_sq = 0.1 * 0.3;
T = [0, 200]; % Ensure T is set correctly for the problem
D = [0, 200];

bv = 0;
h = 10;
k = 0.1;
u = @(x, t) 5.5 * sin(pi * x / 200) .* cos(pi * t * sqrt(0.03) / 200); % Actual Solution

W = HyperbolicFD(f, g, bv, h, k, sqrt(alp_sq), T, D);

xh = D(1):h:D(2);
t = T(1):k:T(2);

tt = 0.2;
jt = tt / k + 1; % Ensure integer index
w = W(jt, :);
er = abs(u(xh, tt) - w);

Tab(:, 1:2) = [xh; u(xh, tt)]';
Tab(:, 3:4) = [w; er]';

[X, Y] = meshgrid(xh, t);
mesh(X, Y, W);
xlabel('space'), ylabel('time'), zlabel('temp');

