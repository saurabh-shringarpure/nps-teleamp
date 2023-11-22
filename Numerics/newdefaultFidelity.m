function y = newdefaultFidelity(x,alpha,gamma, T, eta, RE)
    y = defaultFidelity(x,real(sqrt(T_eff(gamma, T, eta, RE)))*alpha, real(gamma_eff(gamma, T, eta, RE)));
end