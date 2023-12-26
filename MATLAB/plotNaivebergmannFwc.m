function Y = plotNaivebergmannFwc(alpha,X)
pts = size(X, 2);
Y   = zeros(1, pts);
for k  = 1:pts
    Y(k)        = bergmannFwc(alpha, X(k));
end
end