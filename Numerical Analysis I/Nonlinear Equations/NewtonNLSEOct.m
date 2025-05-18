function [xi,iter] = NewtonNLSEOct(fun,x0,N,tol)

%Newton method based on Algorithm 10.1 Burden n Faires

x0=x0(:); %Force to be a column vector

n=length(x0);

x=sym('x',[n 1]);

J=jacobian(fun(x));

JF=function_handle(J,'Vars',sym('x',[n 1]));

Jf=@(x) JF(num2cell(x){:});

xi=x0;

iter=1;

while iter<=N

    A=Jf(xi); F=fun(xi);

    yi=A\F; xi=xi-yi;

    if norm(yi,Inf)<tol

        break;

    end

    iter=iter+1;

end

if iter>N

    fprintf('Maximum number of iterations exceeded')

end

endfunction
