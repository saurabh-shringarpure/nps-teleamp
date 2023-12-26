function Y = plotIdealPsTeleamp(x, X, g, X1, X2, X3)
    pts = size(X,2);
    Y = zeros(1, pts);
    for k  = 1:pts
        Y(k) = PsIdealTeleamp(x, X(k), g, X1, X2, X3);
    end
end