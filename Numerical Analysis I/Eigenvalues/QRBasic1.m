function d = QRBasic1 (A, tol, nmax)

     # QR based on Burden n Faires book

     H # Hessenberg matrix function
     T = H;
     n_iter = 0;
     test = max(max(abs(tril(T, -1))));

     while niter <= nmax & test > tol

        [Q,R] = QRFactRotH(T); #QR factorise function
        T = R*Q;
        niter = niter + 1;
        test = max(max(abs(tril(T, -1))));

     endwhile

     if niter > nmax



     else

     end

     d = diag(T);

endfunction
