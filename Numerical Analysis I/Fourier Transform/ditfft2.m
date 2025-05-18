function X = ditfft2(x)

N = length(x);
X = zeros(1, N);

if N == 1
    X = x;
else
    X(1:N/2) = ditfft2(x(1:2:N-1));
    X(N/2+1:N) = ditfft2(x(2:2:N));

    for k = 1:N/2
        t = X(k);
        W = exp(-2*pi*1i*(k-1)/N);
        X(k) = t + W * X(k + N/2);
        X(k + N/2) = t - W * X(k + N/2);
    end
end

end

