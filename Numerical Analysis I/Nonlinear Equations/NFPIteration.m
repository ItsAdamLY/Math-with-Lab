function [x, iter] = NFPIteration (G, x0, N, tol)

# N = max number of iterations

     iter = 1;

     while iter<=N

          x = G(x0);
          if norm(x-x0,Inf) < tol
             break;
          endif

          x0 = x;
          iter = iter+1;

     endwhile

     if iter>N
          print("Max number of iterations reached.")
     endif

endfunction
