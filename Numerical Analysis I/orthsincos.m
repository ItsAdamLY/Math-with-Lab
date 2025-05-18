f1 = @ (m,x) sin(m*x)
f2 = @ (m,x) cos(m*x)

syms x;

k = 0:2
m = 0:2

# Case for sin-sin

for i=k
     for j=m
          if i ~= j
               res1(i) = int(f1(i,x).*f1(j,x), x, -pi, pi);
          endif
     endfor
endfor

for i=k
     for j=m
          if i == j
               res2(i) = int(f1(i,x).*f1(j,x), x, -pi, pi);
          endif
     endfor
endfor

# Case for cos-cos
for i=k
     for j=m
          if i ~= j
               res3(i) = int(f2(i,x).*f2(j,x), x, -pi, pi);
          endif
     endfor
endfor

for i=k
     for j=m
          if i == j
               res4(i) = int(f2(i,x).*f2(j,x), x, -pi, pi);
          endif
     endfor
endfor

# Case for sin-cos
for i=k
     for j=m
          if i ~= j
               res5(i) = int(f1(i,x).*f2(j,x), x, -pi, pi);
          endif
     endfor
endfor

for i=k
     for j=m
          if i == j
               res6(i) = int(f1(i,x).*f2(j,x), x, -pi, pi);
          endif
     endfor
endfor
