function [tt, w1] = NonLinShoot (odefun, a, b, alp, bet, h, TOL, M)

     N = (b-a)/abs(h);
     TK = (bet-alp)/(b-a);
     k = 1;

##     if (N<2)
##        error('N cannot be less than 2');
##     endif

     tt = linspace(a,b,N+1);
     if h<0
        tt = flip(tt);
     endif

     while k<=M

        [w1,w2] = RungeKutta4h(odefun, [a b], [alp TK 0 1], h);

        if (abs(w1(end) - bet) <= TOL)

           disp('Converged after %d iterations', k)
           break;

        else

           tk = tk - (w1(end) - bet)/w2(end);
           k = k+1;

        endif

     endwhile

     if k>M
        disp('Convergence failed')
     endif


endfunction
