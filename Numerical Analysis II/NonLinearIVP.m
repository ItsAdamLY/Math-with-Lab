function f = NonLinearIVP (x, y)

     f(1) = y(2);
     f(2) = (y(2)^2) / x^3 - (9*y(1)^2) / x^5 + 4 * x;

endfunction
