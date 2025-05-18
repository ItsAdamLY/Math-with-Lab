function W = ParabolicCN(fun,bv,h,k,alp2,T,D)

   %CNFDParabolic to solve Parabolic PDE by Crank_Nicolson Finite Diff Scheme

   %   Detailed explanation goes here

   % Step 1: Number of nodes
   m=(D(2)-D(1))/h+1; n=(T(2)-T(1))/k+1;

   % Step 2: Initialization
   W=zeros(n,m); %A=zeros(m-2);

   % Step 3: Initial values
   x=linspace(D(1),D(2),m);
   W(1,:)=fun(x);

   % Step 4: Boundary values
   W(2:n,1)=bv; W(2:n,m)=bv;

   % Step 5: Construction of matrix A
   lam=alp2*k/h^2;
   ddA=(1+lam)*ones(m-2,1);
   odA=-0.5*lam*ones(m-3,1);
   ddB=(1-lam)*ones(m-2,1);
   odB=0.5*lam*ones(m-3,1);

   A=diag(ddA)+diag(odA,-1)+diag(odA,1);
   B=diag(ddB)+diag(odB,-1)+diag(odB,1);

   % Step 6: Solving in time loop
   w=W(1,2:m-1)';
   wb=zeros(length(w),1); wb(1)=bv*lam; wb(end)=wb(1);

   for j=2:n

      %w=B*w;
      w=A\(B*w+wb);
      W(j,2:m-1)=w;

   end

end
