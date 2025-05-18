function [S,U,V] = salihisvd (A)

     [m,n] = size(A);
     S = zeros(m,n);

     AtA = A'*A;
     [V,D] = eig(AtA);

     # Sorting S and V
     [d, index] = sort(diag(D), 'descend');
     S(1:n,1:n) = diag(d);
     S = sqrt(S); V = V(:, index);

     # Normalising V
     for j=1:n
          V(:,j) = V(:,j)/norm(V(:,j));
     endfor

     # Obtaining eigenvalues & eigenvectors for AA'
     AAt = A*A';
     [U,D] = eig(AAt);

     # Sorting U
     [~, index] = sort(diag(D), 'descend');
     U = U(:,index);

     # Gram Schmidt orthogonalisation
     for j=n+2:m
        U(:,j) = U(:,j) - (U(:,j-1)'*U(:,j))*U(:,j-1)./norm(U(:,j-1))^2;
     endfor

     # Normalising U
     for j=1:n
          U(:,j) = U(:,j)/norm(U(:,j));
     endfor

endfunction
