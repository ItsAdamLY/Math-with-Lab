% Nonlinear shooting method
 % Approximate the solution of y''=(-y'^2-y+log(x))
 % for 1<=x<=2 with y(1)=0 and y(2)=log(2)

 f = @(x,y,z) -z^2-y+log(x);
 fy = @(x,y,z) (-1);
 fz = @(x,y,z) (-2*z);

 a=1; b=2; alpha =0; beta =log(2); tol=10^(-5); n=2; m=10;

 tk = (beta-alpha)/(b-a);
 fprintf('Nonlinear shooting method\n\n');
 fprintf('      x(i)           w(i)\n');
 w1 = zeros(1,n+1);
 w2 = zeros(1,n+1);
 h = (b-a)/n;
 k = 1;

 while k <= m
 w1(1) = alpha;
 w2(1) = tk;
 u1 = 0 ;
 u2 = 1;

 for i = 1 : n
   x = a+(i-1)*h;
   t = x+0.5*h;
   k11 = h*w2(i);
   k12 = h*f(x,w1(i),w2(i));
   k21 = h*(w2(i)+0.5*k12);
   k22 = h*f(t,w1(i)+0.5*k11,w2(i)+0.5*k12);
   k31 = h*(w2(i)+0.5*k22);
   k32 = h*f(t,w1(i)+0.5*k21,w2(i)+0.5*k22);
   k41 = h*(w2(i)+k32);
   k42 = h*f(x+h,w1(i)+k31,w2(i)+k32);
   w1(i+1) = w1(i)+(k11+2*(k21+k31)+k41)/6;
   w2(i+1) = w2(i)+(k12+2*(k22+k32)+k42)/6;
   k11 = h*u2;
   k12 = h*(fy(x,w1(i),w2(i))*u1+fz(x,w1(i),w2(i))*u2);
   k21 = h*(u2+0.5*k12);
   k22 = h*(fy(t,w1(i),w2(i))*(u1+0.5*k11)+fz(t,w1(i),w2(i))*(u2+0.5*k21));
   k31 = h*(u2+0.5*k22);
   k32 = h*(fy(t,w1(i),w2(i))*(u1+0.5*k21)+fz(t,w1(i),w2(i))*(u2+0.5*k22));
   k41 = h*(u2+k32);
   k42 = h*(fy(x+h,w1(i),w2(i))*(u1+k31)+fz(x+h,w1(i),w2(i))*(u2+k32));
   u1 = u1+(k11+2*(k21+k31)+k41)/6;
   u2 = u2+(k12+2*(k22+k32)+k42)/6;
 end

   if abs(w1(n+1)-beta) < tol
      i = 0;
      fprintf('  %11.8f     %11.8f\n', a, alpha);
      for i = 1 : n
        j = i+1;
        x = a+i*h;
        fprintf('  %11.8f     %11.8f\n', x, w1(j));
      end
     fprintf('\nConvergence in %d iterations t=%11.7f \n\n', k, tk);
     break;
   else
     tk = tk-(w1(n+1)-beta)/u1;
     k = k+1;
   end
 end
