%% Coherent state in Fock basis
function y = Coherent(alpha, n)
y = alpha.^n.*exp(1).^((-1/2).*abs(alpha).^2).*factorial(n).^(-1/2);
end