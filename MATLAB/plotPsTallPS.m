function Y = plotPsTallPS(alpha, gamma, eta, RE, X, max_n)
    pts = size(X,2);
    Y = zeros(1, pts);
    for k  = 1:pts
        disp([k,pts,X(k)]);
        Y(k) = min_sum_allnPS_Ps(alpha, gamma, X(k), eta, RE,max_n);
    end
end