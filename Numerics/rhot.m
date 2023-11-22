function y = rhot(rho,mt)
% Inputs:
% rho:          Density operator of the initial pure state
% mt:           Matrix that distorts the input qubit due to ZPS 
% Outputs:
% Density operator of the distorted qubit (still a pure state)
y = mt*rho*mt;
y = y/(trace(y)+1e-18);
end