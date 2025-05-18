tic;
x = [1,1,1]
[xi1, iter1] = NewtonNLSEOct(@(x) ex102b(x),x,50,1e-5)
time1 = toc;


tic;
x = [1,1,1]
[xi2, iter2] = BroydenOct(@(x) ex102b(x),x,50,1e-5)
time2 = toc;

time = [time1, time2]
[timemin, idx] = min(time)
