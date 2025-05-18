function [xh, uh] = LinFinDiff (p, q, r, a, b, alp, bet, h)

     N = (b-a)/h - 1;

     xh = (linspace(a,b,N+2))';

     xi = xh(2:end-1)
     p_i = p(xi);
     q_i = q(xi);
     f = -h^2*r(xi);

     f(1) = f(1) + (1 + p_i(1)*(h/2))*alp;
     f(end) = f(end) + (1 - p_i(end)*(h/2))*bet;

     A = diag(2 + h^2*q_i) + diag(-1 - (h/2)*p_i(2:end), -1) + diag(-1 + (h/2)*p_i(1:end-1), 1);

     # Solving matrix
     uh = A\f;
     uh = [alp; uh; bet];

     if nargout<2
        xh = uh;
     endif

endfunction
