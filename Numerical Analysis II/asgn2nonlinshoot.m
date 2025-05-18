actual_f = @(x) (1/6)*x.^3.*exp(x)-(5/3)*x.*exp(x)+2*exp(x)-x-2;

a = 1; b = 2;
alp = 0; bet = log(256);

tic;
[x,w] = ode45(@NonLinearIVP, [a, b], [alp, (bet-alp)/(b-a), 0, 1]);
y1 = w(:, 1);
y2 = w(:, 3);
y1p = w(:, 2);
y2p = w(:, 4);

z = (bet-y1(end))/y2(end);

#Linear Combination
w1(1) = alp;
w1(2:length(x)) = y1(2:length(x)) + z * y2(2:length(x));
w2(1) = z;
w2(2:length(x)) = y1p(2:length(x)) + z * y2p(2:length(x));
time2 = toc;

##[w(1,:)' w(3,:)' w1(:)]
plot(x,w1, '-o')
hold on
plot(x,actual_f(x))
hold off

err = abs(actual_f(x)-w1)
fprintf("time: %.5f", time2)
