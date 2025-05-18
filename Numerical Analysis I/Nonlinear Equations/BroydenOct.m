function [xi,k] = BroydenOct(fun,x0,N,tol)

   #input : function handle fun, vectors x0, max iter N, tol
   %Broyden method based on Algorithm 10.2 Burden n Faires

   x0=x0(:); %Force to be a column vector
   n=length(x0);
   x=sym('x',[n 1]);
   J=jacobian(fun(x));
   JF=function_handle(J,'Vars',sym('x',[n 1]));
   Jf=@(x) JF(num2cell(x){:});

   xi=x0;

   %Step 1
   A=Jf(xi); v=fun(xi);

   %Step 2 and 3
   A=inv(A); s=-A*v; xi=xi+s; k=2;

   %Step 4
   while k<=N

       %Step 5
       w=v; v=fun(xi); y=v-w;

       %Step 6 to 8
       z=-A*y; p=-s'*z; u=s'*A;

       %Step 9 to 11
       A=A+(s+z)*u./p; s=-A*v; xi=xi+s;

       %Step 12 and 13
       if norm(s)<tol
           break;
       end

       k=k+1;

   end

   if k>N
       fprintf('Maximum number of iterations exceeded\n')
   end

end
