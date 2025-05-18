function L = LoadAssembler1D(x)

     n = length(x) - 1;
     L = zeros(n+1, 1);

     for i=1:n

        h = x(i+1) - x(i);
        b(i) = b(i) + f(x(i))*h/2;
        b(i+1) = b(i+1) + f(x(i))*h/2;

     endfor

endfunction
