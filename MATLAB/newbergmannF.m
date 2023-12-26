%% fidelity considering the recovery by 10.1103/PhysRevA.94.042332 but with a realistic tele-amp before the recovery
function y = newbergmannF(x,alpha,gamma, T, eta, RE)
    y = bergmannF(x,real(sqrt(T_eff(gamma, T, eta, RE)))*alpha, real(gamma_eff(gamma, T, eta, RE)));
end