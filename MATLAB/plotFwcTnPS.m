function Y = plotFwcTnPS(alpha, eta, RE ,gamma, X, epsilon, runs, n)
pts = size(X,2);
Y = zeros(1, pts);
for k  = 1:pts
    Y(k) = max(makeYnPS(alpha, gamma, X(k), eta, RE ,epsilon, runs, n));
end
end