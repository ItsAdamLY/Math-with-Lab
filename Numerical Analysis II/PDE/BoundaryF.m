function [bv] = BoundaryF (x,y,a,b,c,d)
% Function for boundary condition
   if x==a
       bv = 2.*log(y)
   elseif y==c
       bv = log(x.^2 + 1)
   elseif x==b
       bv = log(y.^2 + 1)
   elseif y==d
       bv = log(x.^2 + 4)
   end
end
