function F = NonLinearIVP (f, xx, yy)

     syms x y yp

     f = f(x, y, yp);

     fy = diff(f, y);
     fyp = diff(f, yp);

     f = function_handle(f,'Vars',sym('x',[x y yp]));
     fy = function_handle(fy,'Vars',sym('x',[x y yp]));
     fyp = function_handle(fyp,'Vars',sym('x',[x y yp]));

     F = yy;
     F(1) = yy(2);
     F(2) = f(xx, yy(1), yy(2));
     F(3) = yy(4);
     F(4) = fy(xx, yy(1), yy(2)) + fyp(xx, yy(1), yy(2))*yy(4);

endfunction
