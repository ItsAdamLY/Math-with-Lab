function g = BVPPoisson

   g{1} = @ (x) 0; # u(x,0)
   g{2} = @ (x) 0; # u(x,b)

   g{3} = @ (y) 0; # u(0,y)
   g{4} = @ (y) 0; # u(a,y)
   g

endfunction
