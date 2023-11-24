function y = rhoi2(x)
% Inputs:
% x:    The vector [Y, phi] denoting a point on the Bloch sphere
% Outputs:
% The density operator of the initial pure state
    y = [x(1)^2,   exp(-i*x(2))*x(1)*sqrt(1-x(1)^2); exp(i*x(2))*x(1)*sqrt(1-x(1)^2), 1-x(1)^2 ];
end