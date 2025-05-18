sf = 1600;

v = 80
f = @ (t) 0.3 + sin(2*pi*v*t) + 0.2*cos(2*pi*v*t); # v = 80

t = 0:1/sf:0.05

y = f(t)
c = DFTMatSol(y)
