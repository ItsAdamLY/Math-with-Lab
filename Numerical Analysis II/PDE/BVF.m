function bc = BVF

     uay = @(y) 0;
     uby = @(y) 2*exp(y);
     uxc = @(x) x;
     uxd = @(x) e*x;

     bc = cell(4,1);
     bc{1} = uay;
     bc{2} = uby;
     bc{3} = uxc;
     bc{4} = uxd;

endfunction
