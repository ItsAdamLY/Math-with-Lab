function [L, Ak, Bk] = FourierConst (k, f1, f2, ab1, ab2)

     warning('off');
     syms x;

     L = (ab2(2)-ab1(1))/2;

     K = 1:k;

     Bk(1) = sym2poly((1/(2*L))*int(f1, x, ab1(1), ab1(2)) + (1/(2*L))*int(f2, x, ab2(1), ab2(2)));

     for i=K+1
          Bk(i) = sym2poly((1/L)*int(f1*cos(pi*(i-1)*x/L), x, ab1(1), ab1(2)) + ...
                    (1/L)*int(f2*cos(pi*(i-1)*x/L), x, ab2(1), ab2(2)));
     endfor


     Ak(1) = 0;

     for i=K+1
          Ak(i) = sym2poly((1/L)*int(f1*sin(pi*(i-1)*x/L), x, ab1(1), ab1(2)) + ...
                    (1/L)*int(f2*sin(pi*(i-1)*x/L), x, ab2(1), ab2(2)));
     endfor

endfunction
