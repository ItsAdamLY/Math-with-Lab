function X = ComplexDFT(ft)

    N = length(ft)/2;
    X = zeros(1, 2*N);  % Initialize the result array

    for k=1:N

       X(k) = sum(ft .* exp(-i * pi * k * [0:2*N-1] / N))/(2*N);

    endfor

endfunction

