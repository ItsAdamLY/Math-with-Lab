warning('off');
format long;
fun = @(x) sin(x)
pkg load symbolic
syms x
%Pade Rational Approximation
[p1,q1] = RatPolys(fun,3,3)
px1 = 0; qx1 = 0;
for i=1: length(p1)
  px1 = px1 + p1(i)*x^(i-1);
  qx1 = qx1 +q1(i)*x^(i-1);
endfor
rxp = matlabFunction( px1./qx1);

%Chebyshev Rational Approximation
[p2,q2] = SineChebyshevRat(fun,2,2)
p2(1) = 0; p2(3)=0;
px2 = 0 ; qx2=0;
for j=1:length(p2)
  Tn(j) = chebyshevT(j-1,x);
  px2 = px2 + vpa(expand(p2(j).*Tn(j)));
  qx2 = qx2 + vpa(expand(q2(j).*Tn(j)));
endfor
rxc = matlabFunction(px2./qx2);

for i=1:6
  xi(i) = 0.1*(i-1);
endfor
fx = fun(xi)
fxP = rxp(xi)
fxC = rxc(xi)
Exp = abs(fxP-fx)
ExC = abs(fxC-fx)

