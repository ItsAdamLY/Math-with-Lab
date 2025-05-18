function[Tab]=PoissonFD(a,b,c,d,hx,hy,nx,ny,N,f,u)
%Solving Poisson PDE using FD
%Initialization
m=(b-a)/hx;n=(d-c)/hy;
hd=(hx/hy)^2;
K=diag(-1*ones(1,nx-1),-1)+diag(2*ones(1,nx))+diag(-1*ones(1,nx-1),1);
T=(2*hd)*eye(nx)+K; Arg=cell(1,ny);

%construct matrix A     A=consist of system linear eq by using eq 12.4(Finite Difference Method)

for iy=1:ny
    Arg{iy}=T;
end
A=blkdiag(Arg{:});
A=A+diag(-hd*ones(1,N-nx),-nx)+diag(-hd*ones(1,N-nx),nx);

%construct rhs      bi=obtained from boundary conditions
fb=zeros(N,1);
for iy=1:ny
    for ix=1:nx
        i=ix+(iy-1)*nx;
        fb(i)=hx^2*f(a+ix*hx,c+iy*hy);
    end
end
bi=-fb;
bi(1)=BoundaryF(a+hx,c,a,b,c,d)*hd+BoundaryF(a,c+hy,a,b,c,d)+bi(1);
bi(nx)=BoundaryF(b-hx,c,a,b,c,d)*hd+BoundaryF(b,c+hy,a,b,c,d)+bi(nx);
bi(N-(nx-1))=BoundaryF(a+hx,d,a,b,c,d)*hd+BoundaryF(a,d-hy,a,b,c,d)+bi(N-(nx-1));
bi(N)=BoundaryF(b-hx,d,a,b,c,d)*hd+BoundaryF(b,d-hy,a,b,c,d)+bi(N);
for ix=2:ny-1
    bi(ix)=BoundaryF(a+ix*hx,c,a,b,c,d)*hd+bi(ix);
    bi(N-nx+ix)=BoundaryF(a+ix*hx,d,a,b,c,d)*hd+bi(N-nx+ix);
end
for iy=2:ny-1
    ix=iy-1;
    bi(1+ix*nx)=BoundaryF(a,c+iy*hy,a,b,c,d)+bi(1+ix*nx);
    bi(iy*nx)=BoundaryF(b,c+iy*hy,a,b,c,d)+bi(iy*nx);
end

%Solve Ax=b
w=A\bi;
%prepare for plotting
W=zeros(m+1,n+1);
for ix=1:m+1
    W(ix,1)=BoundaryF(a+(ix-1)*hx,c,a,b,c,d);
    W(ix,n+1)=BoundaryF(a+(ix-1)*hx,d,a,b,c,d);
end
for iy=2:n
    W(1,iy)=BoundaryF(a,c+(iy-1)*hy,a,b,c,d);
    W(m+1,iy)=BoundaryF(b,c+(iy-1)*hy,a,b,c,d);
end
for iy=1:ny
    for ix=1:nx
        i=ix+(iy-1)*nx;
        W(ix+1,iy+1)=w(i);
    end
end
%3D plot
if(hx==0.1)
     x=a:hx:b; y=c:hy:d; [X,Y]=meshgrid(x,y); surf(X,Y,W'); colorbar
end
%Table of comparison
Tab=zeros(7,N);
for ix=1:nx
    for iy=1:ny
        i=iy+(ix-1)*ny;
        Tab(1:2,i)=[ix;iy];
        Tab(3:4,i)=[a+ix*hx;c+iy*hy];
        Tab(5,i)=w(ix+(iy-1)*nx); #internal points
        Tab(6,i)=u(Tab(3,i),Tab(4,i));
        Tab(7,i)=abs(Tab(6,i)-Tab(5,i));
    end
end
end
