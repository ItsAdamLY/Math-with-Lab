clc,clear
A = 7.0;
a=0;b=1;c=0;d=1;
h=.1;k=.1;
m=(b-a)/h;n=(d-c)/k;
f=@(x,y) A.*sin(2*pi*x).*sin(2*pi*y);
g = BVPPoisson;

u=@(x,y) A.*sin(2*pi*x).*sin(2*pi*y)/(8*pi^2); %actual solution
[x1,y1,W1,w1] = Poisson(f,g,a,b,c,d,m,n,u);

h2 = h/2; k2=k/2;
m2=(b-a)/h2;n2=(d-c)/k2;
[x2,y2,W2,w2] = Poisson(f,g,a,b,c,d,m2,n2,u);

h3 = h2/2; k3=k2/2;
m3=(b-a)/h3;n3=(d-c)/k3;
[x3,y3,W3,w3] = Poisson(f,g,a,b,c,d,m3,n3,u);

# Extrapolation
ext1 = (4*w2(1:2:end,1:2:end)-w1)/3;
ext2 = (4*w3(1:4:end,1:4:end)-w2(1:2:end,1:2:end))/3;
ext3 = (16*ext2-ext1)/15;
