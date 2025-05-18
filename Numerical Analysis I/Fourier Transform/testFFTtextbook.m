Frq = 200;
Fun = @ (t) sin(2*pi*Frq*t)+0.5*sin(2*pi*4*Frq*t)+0.8*cos(2*pi*2*Frq*t) +0.4*cos(2*pi*12*Frq*t);
fS = 20000; dts = 1/fS; tau = 0.005;
tp = linspace(0,tau,200);
yp = Fun (tp) ;
ts = 0:dts:tau-dts;
ys = Fun (ts) ;
##plot(tp*1000,yp, 'k' ,ts*1000,ys,'cc')
[C fr] = DFTCmplx(ts,ys);
figure;
stem(fr,real(C) ,'cc' ,'markersize' ,12,'LineWidth' ,1)
figure
stem(fr,imag(C) ,'cc', 'markersize' ,12, 'linewidth' ,1)
