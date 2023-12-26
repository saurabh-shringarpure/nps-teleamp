%% density matrix of the state after the recovery
function y = rhox(rho,Jx)
% rho:  the state before recovery
% Jx:   Choi matrix of some recovery process
y = TrX(Jx*kron(rho.', eye(2)), 1, [4, 2]);
end