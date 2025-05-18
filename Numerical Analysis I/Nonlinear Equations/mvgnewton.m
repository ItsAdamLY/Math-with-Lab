function [xi, k] = mvgnewton (f, x0, tol, steplim, max_iter)

     k = 1;
     x0=x0(:); %Force to be a column vector

     n=length(x0);

     x=sym('x',[n 1]);

     J=jacobian(f(x));

     JF=function_handle(J,'Vars',sym('x',[n 1]))

     Jf=@(x) JF(num2cell(x){:});

     xi = x0;

     while norm(f(xi), 2) > tol

        Nf = norm(f(xi), 2);
        d = -Jf(xi)\f(xi);
        s = 1;

        while norm(f(xi + s*d),2) > (1 - s/2)*Nf

               s = s/2;

               if s < steplim
                  return
               endif

        endwhile


     xi = xi + s*d;
     k = k + 1;

     endwhile

     if k == max_iter

        warning("Max iterations reached");

     endif

endfunction
