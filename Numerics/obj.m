function y = obj(x,R,mt,N)
% Inputs:
% x:            vector [theta, phi] denoting a point on the Bloch sphere
% R:            Choi matrix of recovery
% mt:           Matrix that distorts the input qubit due to ZPS
% N:            Choi of noise
% Output:
% distance norm between the input pure state and the recovered mixed one
rho0            = rhoi2(x);                         % Initial density matrix of the pure qubit state
rhoZPS          = rhot(rho0,    mt);                % Distorted pure qubit after ideal ZPS
rhoLoss         = rhow(rhoZPS,  N);                 % Mixed state after the loss channel
rhoRecovered    = rhox(rhoLoss, R);                 % Mixed state after recovery 
% y = real(trace((rhoRecovered- rho0)^2));          % 2x Hilbert-Schmidt distance norm
y               = real(trace(rhoRecovered*rho0));   % Fidelity b/w rhoRecovered and pure state rho0
end