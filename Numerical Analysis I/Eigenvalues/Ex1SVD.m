# A = USV'

A = [1,0,1;0,1,0;0,1,1;0,1,0;1,1,0];
##AtA = A'*A
##
##[v,d] = eig(AtA) # lambda eigenvalues = s²
##v = sort(v, 'descend')
##
##S = zeros(size(A))
##S(1:3,1:3) = sqrt(d)

[S,U,V] = salihisvd(A)


