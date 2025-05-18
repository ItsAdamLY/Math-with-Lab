t = 0:3;
y = zeros(1,4);
y(2) = 3; y(3) = 2;

[kp Ak Bk] = DFT(t,y);
k = kp;
A = Ak;
B = Bk;

f = @ (x) sum((A.*sin((2*pi*k*x)/t(end)) + B.*cos((2*pi*k*x)/t(end))))

for i=1:4
    x = t(i);
    f(x)
endfor
