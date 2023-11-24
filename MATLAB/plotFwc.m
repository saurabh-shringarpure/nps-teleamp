function Y = plotFwc(alpha, T, eta, RE , X ,epsilon)
    pts = size(X, 2);
    Y = zeros(1, pts);
    for k  = 1:pts
        Y(k) = max(makeY(alpha, X(k), T, eta, RE, epsilon));
    end
end