function y = rhow(rho,Jw)
y = TrX(Jw*kron(rho.', eye(4)), 1, [2, 4]);
end