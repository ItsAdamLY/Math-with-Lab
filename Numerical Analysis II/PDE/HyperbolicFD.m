function W = HyperbolicFD (f,g,bv,h,k,alp,T,D)

   %step1: number of nodes
   M = (D(2)-D(1))/h+1;
   N = (T(2)-T(1))/k+1;
   #alp = sqrt(alp);
   lambda = alp*k/h;

   %step2:initialization
   W = zeros(N,M);

   %step3: first initial values
   x = linspace(D(1),D(2),M);
   W(1,:) = f(x);
   W(2:N,1) = bv; W(2:N,M) = 0; #Only the case when bv = 0
   for j=2:M-1
       W(2,j)=(1-lambda^2)*f(x(j))+lambda^2/2*(f(x(j+1))+f(x(j-1)))+k*g(x(j));
   end

   A_diag=2*(1-lambda^2)*ones(M-2,1);
   A_upper=lambda^2*ones(M-3,1);
   A=diag(A_diag)+diag(A_upper,-1)+diag(A_upper,1);

   w0=W(1,2:M-1)';
   w1=W(2,2:M-1)';
   for j=3:N  #Only the case when bv = 0
       w2=A*w1-w0;
       W(j,2:M-1)=w2;
       w0=w1;
       w1=w2;
   end

end
