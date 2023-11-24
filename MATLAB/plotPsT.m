function Y = plotPsT(alpha, gamma, eta, RE, X)
    pts = size(X,2);
    Y = zeros(1, pts);
    for k  = 1:pts
        Y(k) = min_success_probability(alpha, gamma, X(k), eta, RE);
    end
end