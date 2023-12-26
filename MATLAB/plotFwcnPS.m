function Y = plotFwcnPS(alpha, T, eta, RE , X ,epsilon, runs, n)
pts = size(X, 2);
Y = zeros(1, pts);
for k  = 1:pts
    Y(k) = max(makeYnPS(alpha, X(k), T, eta, RE, epsilon, runs, n));
end
end