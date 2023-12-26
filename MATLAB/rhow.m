%% density matrix of the state after the lossy channel
function y = rhow(rho,Jw)
% rho:  the state before loss
% Jw:   Choi matrix of the lossy channel
y = TrX(Jw*kron(rho.', eye(4)), 1, [2, 4]);
end