%% fidelity between the input pure state and the recovered mixed one
function y = obj(x,R,mt,N)
% x:    vector [cos(theta/2), phi] denoting a point on the Bloch sphere
%       this corresponds to the state: 
%       |psi> = cos(theta/2)|0_comp>+e^(1i*phi)*sin(theta/2)|1_comp> 
% R:    Choi matrix for the recovery
% mt:   matrix that distorts the input qubit due to ZPS
% N:    Choi matrix for the lossy channel
rho0            = rhoi2(x);                         % initial density matrix of the pure qubit state
rhoZPS          = rhot(rho0,    mt);                % distorted pure qubit after ideal ZPS
rhoLoss         = rhow(rhoZPS,  N);                 % mixed state after the loss channel
rhoRecovered    = rhox(rhoLoss, R);                 % mixed state after recovery 
y               = real(trace(rhoRecovered*rho0));   % fidelity b/w rhoRecovered and pure state rho0
end