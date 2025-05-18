clear,clc

v = 100;

f = @(t) 0.3 + sin(2*pi*v*t) + 0.5*sin(2*pi*(5*v)*t) + 0.7*cos(2*pi*(3*v)*t) + 0.4*cos(2*pi*(8*v)*t);

fs = 2000; #sampling frequency

t = 0:1/fs:(0.01 - 1/fs);

t(length(t)+1:2^ceil(log2(length(t)))) = 0;

y = f(t);
N = length(y);

tic

X = ditfft2(y);

time1 = toc

fk = (0:N-1)*(fs/N);

subplot(3,2,1)
stem(fk,real(X),'black','markersize',14)
title("Real part of coefficients of FFT")
subplot(3,2,2)
stem(fk,imag(X) ,'red' ,'markersize' ,14)
title("Imaginary part of coefficients of FFT")

tic

t1 = 0:1/fs:(0.01 - 1/fs);
y1 = f(t1);
[X1, t1] = DFTCmplx(t1, y1);

time2 = toc

subplot(3,2,3)
stem(t1,real(X1),'black','markersize',14)
title("Real part of coefficients of FFT")
subplot(3,2,4)
stem(t1,imag(X1) ,'red' ,'markersize' ,14)
title("Imaginary part of coefficients of FFT")

tic
X1 = fft(y);
time3 = toc

subplot(3,2,5)
stem(fk,real(X1),'black','markersize',14)
title("Real part of coefficients of FFT")
subplot(3,2,6)
stem(fk,imag(X1) ,'red' ,'markersize' ,14)
title("Imaginary part of coefficients of FFT")

