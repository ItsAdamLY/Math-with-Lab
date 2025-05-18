A = zeros(7,7);

a = 1.5:1:7.5;
b = ones(1,7)
A = diag(a) + 0.3*diag(b,-1) + 0.3*diag(b,1)
