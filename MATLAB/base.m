%% Operator basis for the recovery channel
function B = base(l)
	B           = zeros([2,4]); 
    B(:,1:2)    = (1/sqrt(2))*Pauli(mod(l-1,4))* heaviside((9/2)-l);
    B(:,3:4)    = (1/sqrt(2))* Pauli(mod(l-1,4))* heaviside(l-(9/2));
end