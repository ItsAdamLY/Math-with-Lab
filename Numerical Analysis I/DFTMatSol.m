function c = DFTMatSol(y)

y=y(:);

N=length(y); A=ones(N)



%the rotation operator

W=exp(2*pi*i/N);

%loop for the element of matrix

for k=(1:N)

    for j=(1:N)

%use the rotation property

        A(k,j)=W^(k*j);

    endfor

endfor

%solve for the coefficients

c=A\y;

endfunction
