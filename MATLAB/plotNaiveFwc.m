function Y = plotNaiveFwc(alpha, X ,epsilon, runs)
    pts = size(X, 2);
    Y = zeros(1, pts);
    for k  = 1:pts
        Y(k) = max(NaivemakeY(alpha, X(k), epsilon, runs));
    end
end