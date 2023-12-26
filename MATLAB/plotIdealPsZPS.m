function Y = plotIdealPsZPS(x, X, T)
    pts = size(X,2);
    Y = zeros(1, pts);
    for k  = 1:pts
        Y(k) = PsIdealZPS(x, X(k), T);
    end
end