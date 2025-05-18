p = @(x) 0;
q = @(x) 0;
r = @(x) sin(2*pi*x);

[xh1, uh1] = LinFinDiff(p, q, r, 0, 1, 0, 0, 0.1);
#[xh2, uh2] = LinFinDiff(p, q, r, 1, 2, 1, 2, 0.1/2);
#[xh3, uh3] = LinFinDiff(p, q, r, 1, 2, 1, 2, 0.1/4);

c2 = (1/70).*(8-12.*sin(log(2)) - 4.*cos(log(2)));
c1 = 11/10 - c2;
actual_f = @(x) c1.*x + c2./x.^2 - (3/10).*sin(log(x)) - (1/10).*cos(log(x));

output_precision(8)

uh = [uh1 uh2(1:2:end) uh3(1:4:end)]

for k=1:3

   if k<3
     ext(1:length(xh1), k) = (4*uh(:,k+1) - uh(:,k))/3
   else
     ext(1:length(xh1), k) = (16*ext(:, k-1) - ext(:, k-2))/15;
   endif

endfor

[xh1 uh(:,1) uh(:,2) uh(:,3) ext(1:end, 1) ext(1:end, 2) ext(1:end, 3)]

disp("Calculating error:")
[abs(uh(:,1)-actual_f(xh1)) abs(uh(:,2)-actual_f(xh1)) abs(uh(:,3)-actual_f(xh1)) ...
 abs(ext(:,1)-actual_f(xh1)) abs(ext(:,2)-actual_f(xh1)) abs(ext(:,3)-actual_f(xh1))]
##plot(xh, uh);
##hold on
##plot(xh, actual_f(xh));
##hold off
