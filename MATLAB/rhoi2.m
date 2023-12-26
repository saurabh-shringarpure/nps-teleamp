%% density matrix of input pure qubit state
function y = rhoi2(x)
% x:    vector [cos(theta/2), phi] denoting a point on the Bloch sphere
%       this corresponds to the state: 
%       |psi> = cos(theta/2)|0_comp>+e^(1i*phi)*sin(theta/2)|1_comp> 
y = [x(1)^2,   exp(-1i*x(2))*x(1)*sqrt(1-x(1)^2); exp(1i*x(2))*x(1)*sqrt(1-x(1)^2), 1-x(1)^2 ];
end