function fxt = SFourier (k, Ak, Bk,L)

     syms x t;

     K = 1:k;
     fxt = exp(-k^2*t)*sum(Ak(2:end).*sin(pi*x*K(1:end)/L) + Bk(2:end).*cos(pi*x*K(1:end)/L));

endfunction
