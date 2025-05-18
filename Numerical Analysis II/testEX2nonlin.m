syms x y yp;

f = (yp^2)/x^3 - 9*y^2/x^5 + 4*x;

fy = diff(f,y); fyp = diff(f,yp);

actual_f = @(x) x.^3.*log(x);

f = function_handle(f,'Vars',[x y yp]);
fy = function_handle(fy,'Vars',[x y yp]);
fyp = function_handle(fyp,'Vars',[x y yp]);

a = 1; b = 2;
alp = 0; bet = log(256);

h1 = 0.05; N1 = (b-a)/h1 - 1;
h2 = h1/2; N2 = (b-a)/h2 - 1;
h3 = h2/2; N3 = (b-a)/h3 - 1;

[xh1, uh1] = NonLFD(f,fy,fyp, a, b, alp, bet, N1, 1e-8, 50);
[xh2, uh2] = NonLFD(f,fy,fyp, a, b, alp, bet, N2, 1e-8, 50);
[xh3, uh3] = NonLFD(f,fy,fyp, a, b, alp, bet, N3, 1e-8, 50);

output_precision(8)

uh = [uh1 uh2(1:2:end) uh3(1:4:end)];

for k=1:3

   if k<3
     ext(1:length(xh1), k) = (4*uh(:,k+1) - uh(:,k))/3;
   else
     ext(1:length(xh1), k) = (16*ext(:, k-1) - ext(:, k-2))/15;
   endif

endfor

[xh1 uh(:,1) uh(:,2) uh(:,3) ext(1:end, 1) ext(1:end, 2) ext(1:end, 3)]

plot(xh1, uh)
hold on
plot(xh1, actual_f(xh1), '-o')
hold off
