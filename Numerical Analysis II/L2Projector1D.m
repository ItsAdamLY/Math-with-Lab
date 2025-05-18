function L2Projector1D()

     y = @(x) x.*sin(x);

     n = 5;
     h = 1/n; #mesh size
     x = 0:h:1; #mesh
     M = MassAssembler1D(x);
     b = LoadAssembler1D(x, y);
     Pf = M\b;
     plot(x,Pf);

endfunction
