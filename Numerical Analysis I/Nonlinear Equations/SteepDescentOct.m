function [xs,k] = SteepDescentOct(fun,xo,N,tol) #Help finding initial guess for solving eqns

   n=length(xo);

   x=sym('x',[1 n]);

   g=function_handle(sum(fun(x).^2),'vars',x); %for Octave

   cx=num2cell(x);

   gr=function_handle(gradient(g(cx{:})),'vars',x);

   k=1;

while k<N

   cxo=num2cell(xo);

   g1=g(cxo{:}); z=gr(cxo{:})'; zo=norm(z);

   if zo<=1.e-10

      warning('zero gradient')

      xs=xo; gs=g1;

      return

   end

   z=z/zo; a1=0; a3=1; ca3=num2cell(xo-a3*z); g3=g(ca3{:});

   while g3>=g1

       a3=a3/2; ca3=num2cell(xo-a3*z); g3=g(ca3{:});

       if a3<tol/2

           warning('no likely improvement')

           xs=xo; gs=g1;

           return

       end

   end

   a2=a3/2; ca2=num2cell(xo-a2*z); g2=g(ca2{:});

   h1=(g2-g1)/a2; h2=(g3-g2)/(a3-a2); h3=(h2-h1)/a3;

   a0=0.5*(a2-h1/h3); ca0=num2cell(xo-a0*z); g0=g(ca0{:});

   [gi,i]=min([g0,g3]); as=[a0,a3]; a=as(i);

   xo=xo-a*z;

   if abs(gi-g1)<tol

      xs=xo; gs=gi;

      return

   end

   xs=xo;

   k=k+1;

end

if k>N

    fprintf('Maximum number of iterations exceeded\n')

end

end


