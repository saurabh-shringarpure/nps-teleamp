function y = rhox(rho,Jx)
% Inputs:
% rho:          The state before recovery
% Jx:           Choi matrix of some recovery process
% Outputs:
% The state after the recovery  
y = TrX(Jx*kron(rho.', eye(2)), 1, [4, 2]);
end