%% gradient of fidelity in A from 10.1103/PhysRevA.84.062125
function y = gradA(M, R)
% M:    gradient of fidelity in R
% R:    Choi matrix for the recovery
y   = R*(M -0.5*kron(TrX(M*R+R*M,2,[4,2]),eye(2)))+(M -0.5*kron(TrX(M*R+R*M,2,[4,2]),eye(2)))'*R';
end