function [xs, iter] = SteepDes (fh, x0, tol, N)

     n = length(x0);
     x = sym('x', [1 n]);
     g = function_handle(sum(fh(x).^2), 'Vars', x);

     k = 1

     while k<N

          cx0 = num2cell(x0);
          g1 = g(cx0{:}); z = gr(cx0{:})'; z0 = norm(z);

          if z0 <= 1e-10
            warning('Zero Gradient')
            xs = x0; gs = g1;
            return
          endif

          z = z/z0; a1 = 0; a3= 1;
          ca3 = num2cell(x0-a3*z);
          g3 = g(ca3{:});

          while g3>=g1



          endwhile

     endwhile

endfunction
