g1 = @ (x)  (x(1)^2 + x(2)^2 + 8)/10
g2 = @ (x) (x(1)*x(2)^2 + x(1) + 8)/10

##g1 = @ (x) 1 - cos(x(1).*x(2).*x(3))
##g2 = @ (x) 1 - (1-x(1))^0.25 - 0.05*x(3)^2 + 0.15*x(3)
##g3 = @ (x) x(1)^2 + 0.1*x(2)^2 - 0.01*x(2) + 1
##
##syms x y z;
##allx = [x,y,z];
##G1 = g1(allx);
##G2 = g2(allx);
##G3 = g3(allx);
##
##dG1x1 = function_handle(diff(G1, x));
##dG1x2 = function_handle(diff(G1, y));
##dG1x3 = function_handle(diff(G1, z));
##
##dG2x1 = function_handle(diff(G2, x));
##dG2x2 = function_handle(diff(G2, y));
##dG2x3 = function_handle(diff(G2, z));
##
##dG3x1 = function_handle(diff(G3, x));
##dG3x2 = function_handle(diff(G3, x));
##dG3x3 = function_handle(diff(G3, x));

##dg1x1 = @ (x1, x2) 2*x1/10;
##dg1x2 = @ (x1, x2) 2*x2/10;
##dg2x1 = @ (x1, x2) (x2^2 + 1)/10;
##dg2x2 = @ (x1, x2) (2*x1*x2)/10;

G = @ (x) [g1(x), g2(x)]'

##[x, iter] = NFPIteration(G, [0.5, 0.5], 50, 1e-5)
[x, iter] = NewtonMtd(G, [0.5, 0.5], 1e-5, 50)
