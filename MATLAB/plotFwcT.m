function Y = plotFwcT(alpha, eta, RE ,gamma, X, epsilon, runs)
    pts = size(X,2);
    Y = zeros(1, pts);
    for k  = 1:pts
        Y(k) = max(makeY(alpha, gamma, X(k), eta, RE ,epsilon, runs));
    end
end