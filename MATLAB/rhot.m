%% density matrix of the distorted qubit (still a pure state)
function y = rhot(rho,mt)
% rho:  density operator of the initial pure state
% mt:   matrix that distorts the input qubit due to ZPS 
y = mt*rho*mt';
y = y/(trace(y)+1e-18);
end