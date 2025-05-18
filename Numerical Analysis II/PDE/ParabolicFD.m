function W = ParabolicFD(fun,bv,h,k,alp2,T,D)

   %FFDParabolic to solve Parabolic PDE by Forward Finite Diff Scheme

   %   Detailed explanation goes here

   % Step 1: Number of nodes
   m=(D(2)-D(1))/h+1; n=(T(2)-T(1))/k+1;

   % Step 2: Initialization
   W=zeros(n,m);

   % Step 3: Initial values
   x=linspace(D(1),D(2),m);
   W(1,:)=fun(x);

   % Step 4: Boundary values
   W(2:n,1)=bv; W(2:n,m)=bv;

   % Step 5: Construction of matrix A
   lam=alp2*k/h^2;
   dd=(1-2*lam)*ones(m-2,1);
   od=lam*ones(m-3,1);
   A=diag(dd)+diag(od,-1)+diag(od,1);

   % Step 6: Solving in time loop

   w=W(1,2:m-1)';

   for j=2:n

      w=A*w;

      W(j,2:m-1)=w;

   end

end
