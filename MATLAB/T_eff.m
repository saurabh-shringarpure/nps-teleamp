function y = T_eff(gamma, T, eta, RE)
    y  = real(( T/etap(T,eta))*(gpp(gp(g(gamma, T, eta, RE),R2(g(gamma, T, eta, RE), RE , eta)),R1(gamma, T,eta)))^2);
 end