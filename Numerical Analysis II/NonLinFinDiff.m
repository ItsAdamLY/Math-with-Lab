function retval = NonLinFinDiff (f,fy,fyp,a,b,alp,bet,N,TOL,max_iter)

     h = (b-a)/(N+1);
     xh = (linspace(a,b,N+2))';

     uh = 1:N; uh = alp+h*(bet-alp)/(b-a)*uh';
     uh = {al;uh;bt};
     k = 1;

     # construct jacobian
     while k<=max_iter

        x1 = xh(2:end-2); x2 = xh(2:end-2); x3 = (uh(3:end-1) - uh(1:end-3))/(2*h);
        Ju =

     endwhile

endfunction
