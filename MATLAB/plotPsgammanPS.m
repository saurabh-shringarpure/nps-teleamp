function Y = plotPsgammanPS(alpha, T, eta, RE, X,n)
    pts = size(X,2);
    Y = zeros(1, pts);
    for k  = 1:pts
        Y(k) = minPs(alpha, X(k), T, eta, RE,n,1,1,1);
    end
end