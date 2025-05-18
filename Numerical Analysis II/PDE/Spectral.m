% ac.m solving u_t=u_xx+u-u^3 by semi-implicit time stepping via FFT
n=32; dx=2*pi/n; x=0:dx:2*pi-dx; nu=0.05; h=0.1;
ssteps=5; % ssteps=small steps, internal integration loop
psteps=20;% psteps=plotting steps=number of time slices to plot
tmax=h*(psteps-1)*ssteps;t=0;
nv = fftshift(-n/2:1:n/2-1);mu=1./(1+nv.^2*h*nu); % mu holds F-multipliers
% generate IC ’blockwise random’
nb=4; u0=[]; for k=1:n/nb; u0=[u0 0.5*(rand(1,1)-0.5)*ones(1,nb)]; end
tv=0:h*ssteps:h*(psteps-1)*ssteps; % for plotting
[X,T]=meshgrid(x,tv); [N,T]=meshgrid(-n/2:n/2-1,tv);
ua=zeros(psteps,n); ua(1,:)=u0; u=u0; uh=fft(u0);% ua holds u for plotting
va=zeros(psteps,n); va(1,:)=abs(fftshift(uh))/n; % va holds uhat for plotting
for i=2:psteps % outer integration loop, with plotting
     for j=1:ssteps % inner integration loop, no plotting
          fh=fft(u-u.*u.*u); uh=mu.*(uh+h*fh);u=ifft(uh); % integration step
     end
     ua(i,:)=real(u);va(i,:)=abs(fftshift(uh))/n;t=t+ssteps*h;
end
figure(1);surf(X,T,ua);figure(2);surf(N,T,va); % plotting
