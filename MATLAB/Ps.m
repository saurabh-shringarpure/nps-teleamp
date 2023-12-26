%% success probability
function y = Ps(x, alpha, gamma, T, eta, RE, n, X1, X2, X3)
a       = x(1);
phi     = x(2);
b       = sqrt(1-x(1).^2).*exp(1i*phi);

c(1)    = a.*normalization(0,0,alpha)+b.*normalization(1,0,alpha);  % c_0 amplitude for $\ket{\alpha}
c(2)    = a.*normalization(0,0,alpha)-b.*normalization(1,0,alpha);  % c_1 amplitude for $\ket{i\alpha}
c(3)    = a.*normalization(0,0,alpha)+b.*normalization(1,0,alpha);  % c_2 amplitude for $\ket{-\alpha}
c(4)    = a.*normalization(0,0,alpha)-b.*normalization(1,0,alpha);  % c_3 amplitude for $\ket{-i\alpha}

sum     = 0;
for j = 0:3
    for k = 0:3
        sum = sum + sqrt(-1).^(((-1).*j+k).*((-3)+n+X1+X2+X3)).*exp(1).^((-1).*(1+(-1) ...
            .*sqrt(-1).^((-1).*j+k)).*alpha.^2.*(1+(-1).*eta.*(1+(-1).*T)+ ...
            gamma.*T.*((-1)+2.*(1+(-1).*eta)+g(gamma,T,eta,RE).^2+(1+(-1).*RE) ...
            .^(-1).*RE.*(1+g(gamma,T,eta,RE).^2)))).*c(1+k).*conj(c(1+j));
    end
end

prefactor       = 2.^((-1).*X2+(-1).*X3).*exp(1).^((-2).*alpha.^2.*eta.*((1/2).*(1+( ...
    -1).*T)+gamma.*T)).*(alpha.*(eta.*(1+(-1).*T)).^(1/2)).^(2.*n).*( ...
    alpha.*(eta.*gamma.*T).^(1/2)).^(2.*X1+2.*X2+2.*X3).*factorial(n) ...
    .^(-1).*factorial(X1).^(-1).*factorial(X2).^(-1).*factorial(X3).^( ...
    -1).*normalization(0,1,alpha.*(gamma.*(1+(-1).*RE).^(-1).*T.*(1+g( ...
    gamma,T,eta,RE).^2)).^(1/2)).^2;

y       = real(prefactor.*sum);
end