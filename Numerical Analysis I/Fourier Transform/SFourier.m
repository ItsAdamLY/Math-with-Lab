function fx = SFourier (k, Ak, Bk,L)

     syms x;

     K = 1:k;
     fx = Ak(1) + Bk(1) + sum(Ak(2:end).*sin(pi*x*K(1:end)/L) + Bk(2:end).*cos(pi*x*K(1:end)/L));

endfunction
