X   = linspace(1,3,30);
X   = X;
sz  = size(X,2);
Y =zeros(4,sz);
for k = 1:sz
Y(1,k)= normalization(0,0,X(k));
Y(2,k)= normalization(1,0,X(k)); 
Y(3,k)= normalization(0,1,X(k));
Y(4,k)= normalization(1,1,X(k)); 
end
plot(X, Y,'LineWidth',2)
%%
x       = [sqrt(0.4) 2.3];
a       = x(1);
phi     = x(2);
b       = sqrt(1-x(1).^2).*exp(1i*phi);

c(1)    = a.*normalization(0,0,alpha)+b.*normalization(1,0,alpha);  % c_0 amplitude for $\ket{\alpha}$
c(2)    = a.*normalization(0,0,alpha)-b.*normalization(1,0,alpha);  % c_1 amplitude for $\ket{i\alpha}$                                                  % c_1
c(3)    = c(1);                                                     % c_2 amplitude for $\ket{-\alpha}$
c(4)    = c(2); 
c
%%
norm_test = 0;
for j =0:3
for k =0:3
norm_test = norm_test+conj(c(j+1))*c(k+1)*CohInner(alpha*(1i)^j,alpha*(1i)^k);
end
end
norm_test
% correct normalization
%%
alpha   = 2;
X1 = 1;
X2 = 1;
X3 = 1;
g  = 1.25;
sum     = 0;
for j       = 0:3
    for k   = 0:3
        sum = sum + sqrt(-1).^(((-1).*j+k).*((-3)+X1+X2+X3)).*exp(1).^((-1).*(1+(-1).* ...
            sqrt(-1).^((-1).*j+k)).*alpha.^2.*g.^2).*c(1+k).*conj(c(1+j));
    end
end

y       = 2.^((-1).*X2+(-1).*X3).*alpha.^(2.*X1+2.*X2+2.*X3).*exp(1).^((-2) ...
    .*alpha.^2).*factorial(X1).^(-1).*factorial(X2).^(-1).*factorial( ...
    X3).^(-1).*normalization(0,1,alpha.*(1+g.^2).^(1/2)).^2.*(sum);

y       = real(y)
%%
tic;
[minval,xopt]=min_sum_allnPSallTeleamp_Ps( 2, .90, .35, .95, 0, 7)
toc;
%% sum_allnPSallTeleamp_Ps(x,alpha, gamma, T, eta, RE, max_n)
sum_allnPSallTeleamp_Ps([0.2345 0], 2, .90, .35, .95, 0,7)
%%
x =[1 0];
a       = x(1);
phi     = x(2);
b       = sqrt(1-x(1).^2).*exp(1i*phi);

% converting to 0 , 1 basis
a01 = sqrt(4*exp(-alpha.^2).*cosh(alpha.^2)).*(sqrt(1+2.*(real(conj(a).*b).* cos(alpha^2).*sech(alpha^2)))).*(a.*normalization(0,0,alpha)+b.*normalization(1,0,alpha));
b01 = sqrt(4*exp(-alpha.^2).*cosh(alpha.^2)).*(sqrt(1+2.*(real(conj(a).*b).* cos(alpha^2).*sech(alpha^2)))).*(a.*normalization(0,0,alpha)-b.*normalization(1,0,alpha));

[a01 b01]
%%
n   = 0;
X1  = 1;
X2  = 1;
X3  = 1;
alpha   = 2;
eta     = 1;
RE      = 0;
gamma   = 0.9;
pts     = 21;
T       = linspace(1e-3, 1 , pts);
Y = zeros(1,pts);
for k = 1:pts
[Y(k),~] = minPs(alpha, gamma, T(k), eta, RE, n, X1, X2, X3); 
end
plot(T, Y, 'LineWidth', 2)
