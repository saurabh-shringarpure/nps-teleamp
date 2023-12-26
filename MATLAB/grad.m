%% gradient of fidelity in R
function M = grad(x, mt, N)
% R:    Choi matrix for the recovery
% x:    vector [cos(theta/2), phi] denoting a point on the Bloch sphere
%       this corresponds to the state:
%       |psi> = cos(theta/2)|0_comp>+e^(1i*phi)*sin(theta/2)|1_comp>
% mt:   Matrix that distorts the input qubit due to ZPS
% N:    Choi of noise
rho0            = rhoi2(x);             % Initial density matrix of the pure qubit state
rhoZPS          = rhot(rho0,mt);        % Distorted pure qubit after ideal ZPS
rhoLoss         = rhow(rhoZPS,N);       % Mixed state after the loss channel
M               = kron(rhoLoss.',rho0); % Note how this turns out to be independent of R
end