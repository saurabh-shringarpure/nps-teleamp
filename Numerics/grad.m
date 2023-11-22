function y = grad(x, R, mt, N)
% Inputs:
% R:            Choi matrix of the recovery
% x:            vector [theta, phi] denoting a point on the Bloch sphere
% mt:           Matrix that distorts the input qubit due to ZPS
% N:            Choi of noise
rho0            = rhoi2(x);                  % Initial density matrix of the pure qubit state
rhoZPS          = rhot(rho0,mt);            % Distorted pure qubit after ideal ZPS
rhoLoss         = rhow(rhoZPS,N);           % Mixed state after the loss channel
%rhoRecovered    = rhox(rhoLoss,R);          % Mixed state after recovery
%M = 2*kron(rhoLoss.',rhoRecovered-rho0);   % gradient of 2*HS distance
%y = M';                                     % conjugation, in case numerics give non-Hermitian result
M  = kron(rhoLoss.',rho0);                  % independent of R
y  = M;
end