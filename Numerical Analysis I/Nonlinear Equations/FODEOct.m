function f = FODEOct (fun, x0, y)

     x0=x0(:);
     n = length(x0);
     x = sym('x', [n, 1]);

     J = jacobian(fun(x));
     JFx = function_handle(J, 'Vars', sym('x', [n,1]));

     Jf = @ (x) JFx(num2cell(x){:});

     f = -Jf(y)\fun(x0);

endfunction
