tic
[xi,iter1] = SteepDescentOct(@(x) eqns(x), [1,1,1], 50, 1e-6);
time1 = toc

tic
[x,iter2] = mvgnewton(@(x) eqns(x), [1,1,1], 1e-6, 1e-9, 50);
time2 = toc
