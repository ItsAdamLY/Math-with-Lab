#actual_f = @(x) -(1/10)*(sin(x) + 3*cos(x));
#actual_f = @ (x) 4/x - 2/(x.^2) + log(x) - 3/2;
c2 = (1/70)*(8-12*sin(log(2))-4*cos(log(2)));
c1 = (11/10)-c2;
actual_f = @(x) c1.*x + c2.*(x.^-2) - (3./10).*sin(log(x)) - (1./10).*cos(log(x));

a = 1; b = 2;
alp = 1; bet = 2;
[x, y1, y2, y1p, y2p, w, w1, w2] = LinShoot(@LinearIVP, a, b, alp, bet, 0.1);

plot(x,w1, '-o')
hold on
plot(x,actual_f(x))
hold off
