f = @(x,y,yp) (1/8)*(32 + 2*x^3 - y*yp);

F = NonLinearIVP(f,
