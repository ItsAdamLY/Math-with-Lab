n=50;
dx=2*pi/n;
x=0:dx:2*pi-dx;
eta=0.5;
h=0.1;

alp = 1/16;

psteps=11; tmax=h*(psteps-1); % psteps=# time-slices to plot
nv=fftshift(-n/2:1:n/2-1); % wave numbers
mu=(1-h*(1-eta)*alp*nv.^2)./(1+eta*alp*nv.^2*h); % F-multiplier vector

u0=2*sin(x);
u=u0;
uf=fft(u); % initial condition

t=0:h:h*(psteps-1);
ua=zeros(psteps,n);
ua(1,:)=u0; % for plotting
for i=2:psteps % integration loop
     uf=mu.*uf;
     u=ifft(uf);
     ua(i,:)=real(u); % back to x only for plotting
end
[X,T]=meshgrid(x,t);surf(X,T,ua); % plot

actual_f = @(x,t) 2*exp(-t/16).*sin(x);
abs(actual_f(X,T) - ua)
