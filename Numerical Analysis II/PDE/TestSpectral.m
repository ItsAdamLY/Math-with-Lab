u0x = @(x) 2*sin(x);
alp2 = (1/16);

syms x t;

n=50;
k = n/2;
[L, Ak, Bk] = FourierConst(k, u0x, [0 2*pi]);
u_hat0 = SFourier(k,Ak,Bk,L);

dFdt = diff(u_hat0, t);
d2Fdx2 = diff(diff(u_hat0,x),x);

fode = dFdt - alp2*d2Fdx2;

tm_final = 1;
tm = 0;

while tm<tm_final
[t,x] = ode45(function_handle(fode), [0 2*pi], tm);
u = ifft(t);
u(i,:) = u;
tm = tm+0.1;
endwhile

xd = linspace(0,2*pi,50);
td = linspace(0,2*pi,50);

plot(xd,u);

