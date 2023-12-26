function Y = plotPsTnPS(alpha, gamma, eta, RE, X, n)
    pts = size(X,2);
    Y = zeros(1, pts);
    for k  = 1:pts
        Y(k) = minPs(alpha, gamma, X(k), eta, RE, n, 1, 1, 1);
    end
end