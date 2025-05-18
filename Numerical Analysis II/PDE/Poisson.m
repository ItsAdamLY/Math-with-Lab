function [x,y,W,w]=Poisson(f,g,xl,xr,yb,yt,M,N,u)

    m=M+1;n=N+1; mn=m*n;
    h=(xr-xl)/M;h2=h^2;k=(yt-yb)/N;k2=k^2;
    x = xl + (0:M)*h;
    y = yb + (0:N)*k;
    A=zeros(mn,mn);b=zeros(mn,1);

    for i=2:m-1 % interior points
       for j=2:n-1
          A(i+(j-1)*m,i-1+(j-1)*m)=1/h2;
          A(i+(j-1)*m,i+1+(j-1)*m)=1/h2;
          A(i+(j-1)*m,i+(j-1)*m)=-2/h2-2/k2;
          A(i+(j-1)*m,i+(j-2)*m)=1/k2;
          A(i+(j-1)*m,i+j*m)=1/k2;
          b(i+(j-1)*m)=f(x(i),y(j));
       end
    end

    for i=1:m % bottom and top boundary points
       j=1;
       A(i+(j-1)*m,i+(j-1)*m)=1;
       b(i+(j-1)*m)=g{1}(x(i));

       j=n;
       A(i+(j-1)*m,i+(j-1)*m)=1;
       b(i+(j-1)*m)=g{2}(x(i));
    end

    for j=2:n-1 % left and right boundary points
       i=1;A(i+(j-1)*m,i+(j-1)*m)=1;
       b(i+(j-1)*m)=g{3}(y(j));
       i=m;A(i+(j-1)*m,i+(j-1)*m)=1;
       b(i+(j-1)*m)=g{4}(y(j));
    end

    W=A\b; % solve for solution in v labeling
    w=reshape(W(1:mn),m,n); %translate from v to w
    [X,Y] = meshgrid(x,y);
    mesh(X,Y,w')

endfunction
