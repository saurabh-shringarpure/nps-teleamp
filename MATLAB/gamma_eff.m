%% effective channel transmission of the complete process
function y = gamma_eff(gamma, T, eta, RE)
    y = real((1+(-1).*R1p(g(gamma,T,eta,RE),R1(gamma,T,eta))).*(1+(-1).* R2(g(gamma,T,eta,RE),RE,eta)));
end