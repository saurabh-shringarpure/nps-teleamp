function Y = plotbergmannFwc(alpha, T, eta, RE ,X)
    pts = size(X, 2); 
    Y   = zeros(1, pts);
    for k  = 1:pts
        gamma       = X(k);
        Teff        = T_eff(gamma, T, eta, RE);
        gammaeff    = gamma_eff(gamma, T, eta, RE);
        Y(k)        = bergmannFwc(sqrt(Teff)*alpha, gammaeff);
    end
end