function y = success_probability(x, alpha, gamma, T, eta, RE)
    a       = x(1);
    phi     = x(2);
    b       = sqrt(1-x(1).^2).*exp(1i*phi);

    c(1)    = a.*normalization(0,0,alpha)+b.*normalization(1,0,alpha);
    c(2)    = c(1);
    c(3)    = a.*normalization(0,0,alpha)-b.*normalization(1,0,alpha);
    c(4)    = c(3);
    
    sum     = 0;
    for j       = 1:4
        for k   = 1:4
            sum = sum + exp(1).^((-1).*(1+(-1).*sqrt(-1).^((-1).*j+k)).*alpha.^2.*gamma.* ...
                    T.*(2.*(1+(-1).*eta)+g(gamma,T,eta,RE).^2+(1+(-1).*RE).^(-1).*RE.* ...
                    (1+g(gamma,T,eta,RE).^2))).*c(k).*conj(c(j));
        end
    end

    y       = (1/4).*alpha.^6.*exp(1).^((-1).*alpha.^2.*eta.*(1+(-1).*T)+(-2).* ...
                alpha.^2.*eta.*gamma.*T).*eta.^3.*gamma.^3.*T.^3.*normalization(0, ...
                1,alpha.*(gamma.*(1+(-1).*RE).^(-1).*T.*(1+g(gamma,T,eta,RE).^2)) ...
                .^(1/2)).^2.*(sum);

    y       = real(y);
end