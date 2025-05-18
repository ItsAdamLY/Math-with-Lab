function f = LinearIVP (x, y)

     p = 2;
     q = -1;
     r = x*exp(x) - x;

     f = y;
     # w1 = y1
     # w2 = y'1
     # w3 = y2
     # w4 = y'2
     f(1) = y(2);
     f(2) = p*y(2) + q*y(1) + r;
     f(3) = y(4);
     f(4) = p*y(4) + q*y(3);

endfunction
