function [xh,uh] = NonLFD(f,fy,fyp,a,b,al,bt,N,tol,M)

%To approximate the solution of nonlinear bvp by FDM

%Step 1: h: size of inverval, xh: discrete nodes
h=(b-a)/(N+1); xh=(linspace(a,b,N+2))';

%Step 2: Initialization
uh=1:N; uh=al+h*(bt-al)/(b-a)*uh'; uh=[al;uh;bt]; k=1;

%Step 3: Newton Loop
while k<=M

   %Step 4: Construct the Jacobian Matrix

   x1=xh(2:end-2); x2=uh(2:end-2); x3=(uh(3:end-1)-uh(1:end-3))/(2*h);
   Ju=diag(-1+h*fyp(x1,x2,x3)/2,1);

   x1=xh(2:end-1); x2=uh(2:end-1); x3=(uh(3:end)-uh(1:end-2))/(2*h);
   Jd=diag(2+h^2*fy(x1,x2,x3));

   x1=xh(3:end-1); x2=uh(3:end-1); x3=(uh(4:end)-uh(2:end-2))/(2*h);
   Jl=diag(-1-h*fyp(x1,x2,x3)/2,-1);

   x1=xh(2:end-1); x2=uh(2:end-1); x3=(uh(3:end)-uh(1:end-2))/(2*h);
   F=-(2*uh(2:end-1)-uh(1:end-2)-uh(3:end)+h^2*f(x1,x2,x3));

   %Step 5: Solve and update
   v=(Ju+Jd+Jl)\F; uh(2:end-1)=uh(2:end-1)+v;

   %Step 6: Stopping Criterion

   if norm(v)<=tol

       break

   end

   k=k+1;

end

if k>M
    fprintf(1, 'Method failed after %d iterations\n', M);
end

end
