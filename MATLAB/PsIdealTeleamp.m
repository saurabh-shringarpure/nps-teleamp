%% success probability for ideal teleamp
function y = PsIdealTeleamp(x, alpha, g, X1, X2, X3)
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
        sum = sum + (sqrt(-1).^(((-1).*j+k).*((-3)+X1+X2+X3)).*exp(1).^((-1).*(1+(-1).* ...
            sqrt(-1).^((-1).*j+k)).*alpha.^2.*g.^2).*c(1+k).*conj(c(1+j)));
    end
end

y       = (2.^((-1).*X2+(-1).*X3).*alpha.^(2.*X1+2.*X2+2.*X3).*exp(1).^((-2) ...
    .*alpha.^2).*factorial(X1).^(-1).*factorial(X2).^(-1).*factorial( ...
    X3).^(-1).*normalization(0,1,alpha.*(1+g.^2).^(1/2)).^2).*(sum);

y       = real(y);
end