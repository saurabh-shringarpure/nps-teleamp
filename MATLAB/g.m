%% gain needed for amplitude restoration
function y = g(gamma, T, eta, RE)
    y = 6.^(-1/2).*((-2).*gamma.^(-1).*T.^(-1).*((-1).*eta+(eta+gamma+(-2) ...
  .*eta.*gamma).*T+RE.*((-1)+eta+eta.*((-1)+2.*gamma).*T))+2.*2.^( ...
  1/3).*(3+(-3).*eta+eta.^2+((-3)+2.*eta).*((-1).*eta+((-1)+2.*eta) ...
  .*gamma).*T+(eta+gamma+(-2).*eta.*gamma).^2.*T.^2+RE.^2.*((-1)+ ...
  eta+eta.*((-1)+2.*gamma).*T).^2+(-1).*RE.*(2.*((-1)+eta).*eta+(2.* ...
  (1+(-2).*eta).*eta+(5+(-12).*eta+8.*eta.^2).*gamma).*T+2.*eta.*(( ...
  -1)+2.*gamma).*((-1).*eta+((-1)+2.*eta).*gamma).*T.^2)).*(9.*eta.* ...
  gamma.^3.*T.^3+(-9).*eta.^2.*gamma.^3.*T.^3+2.*eta.^3.*gamma.^3.* ...
  T.^3+9.*gamma.^3.*RE.*T.^3+(-18).*eta.*gamma.^3.*RE.*T.^3+15.* ...
  eta.^2.*gamma.^3.*RE.*T.^3+(-6).*eta.^3.*gamma.^3.*RE.*T.^3+6.* ...
  eta.*gamma.^3.*RE.^2.*T.^3+(-12).*eta.^2.*gamma.^3.*RE.^2.*T.^3+ ...
  6.*eta.^3.*gamma.^3.*RE.^2.*T.^3+2.*gamma.^3.*RE.^3.*T.^3+(-6).* ...
  eta.*gamma.^3.*RE.^3.*T.^3+6.*eta.^2.*gamma.^3.*RE.^3.*T.^3+(-2).* ...
  eta.^3.*gamma.^3.*RE.^3.*T.^3+(-9).*eta.*gamma.^3.*T.^4+18.* ...
  eta.^2.*gamma.^3.*T.^4+(-6).*eta.^3.*gamma.^3.*T.^4+45.*gamma.^4.* ...
  T.^4+(-72).*eta.*gamma.^4.*T.^4+12.*eta.^2.*gamma.^4.*T.^4+12.* ...
  eta.^3.*gamma.^4.*T.^4+18.*eta.*gamma.^3.*RE.*T.^4+(-30).*eta.^2.* ...
  gamma.^3.*RE.*T.^4+18.*eta.^3.*gamma.^3.*RE.*T.^4+(-18).* ...
  gamma.^4.*RE.*T.^4+15.*eta.*gamma.^4.*RE.*T.^4+36.*eta.^2.* ...
  gamma.^4.*RE.*T.^4+(-36).*eta.^3.*gamma.^4.*RE.*T.^4+(-6).*eta.* ...
  gamma.^3.*RE.^2.*T.^4+24.*eta.^2.*gamma.^3.*RE.^2.*T.^4+(-18).* ...
  eta.^3.*gamma.^3.*RE.^2.*T.^4+(-15).*gamma.^4.*RE.^2.*T.^4+51.* ...
  eta.*gamma.^4.*RE.^2.*T.^4+(-72).*eta.^2.*gamma.^4.*RE.^2.*T.^4+ ...
  36.*eta.^3.*gamma.^4.*RE.^2.*T.^4+6.*eta.*gamma.^3.*RE.^3.*T.^4+( ...
  -12).*eta.^2.*gamma.^3.*RE.^3.*T.^4+6.*eta.^3.*gamma.^3.*RE.^3.* ...
  T.^4+(-12).*eta.*gamma.^4.*RE.^3.*T.^4+24.*eta.^2.*gamma.^4.* ...
  RE.^3.*T.^4+(-12).*eta.^3.*gamma.^4.*RE.^3.*T.^4+(-9).*eta.^2.* ...
  gamma.^3.*T.^5+6.*eta.^3.*gamma.^3.*T.^5+36.*eta.*gamma.^4.*T.^5+( ...
  -6).*eta.^2.*gamma.^4.*T.^5+(-24).*eta.^3.*gamma.^4.*T.^5+(-63).* ...
  gamma.^5.*T.^5+96.*eta.*gamma.^5.*T.^5+(-60).*eta.^2.*gamma.^5.* ...
  T.^5+24.*eta.^3.*gamma.^5.*T.^5+15.*eta.^2.*gamma.^3.*RE.*T.^5+( ...
  -18).*eta.^3.*gamma.^3.*RE.*T.^5+3.*eta.*gamma.^4.*RE.*T.^5+(-48) ...
  .*eta.^2.*gamma.^4.*RE.*T.^5+72.*eta.^3.*gamma.^4.*RE.*T.^5+42.* ...
  gamma.^5.*RE.*T.^5+(-138).*eta.*gamma.^5.*RE.*T.^5+144.*eta.^2.* ...
  gamma.^5.*RE.*T.^5+(-72).*eta.^3.*gamma.^5.*RE.*T.^5+(-12).* ...
  eta.^2.*gamma.^3.*RE.^2.*T.^5+18.*eta.^3.*gamma.^3.*RE.^2.*T.^5+( ...
  -21).*eta.*gamma.^4.*RE.^2.*T.^5+78.*eta.^2.*gamma.^4.*RE.^2.* ...
  T.^5+(-72).*eta.^3.*gamma.^4.*RE.^2.*T.^5+42.*eta.*gamma.^5.* ...
  RE.^2.*T.^5+(-108).*eta.^2.*gamma.^5.*RE.^2.*T.^5+72.*eta.^3.* ...
  gamma.^5.*RE.^2.*T.^5+6.*eta.^2.*gamma.^3.*RE.^3.*T.^5+(-6).* ...
  eta.^3.*gamma.^3.*RE.^3.*T.^5+(-24).*eta.^2.*gamma.^4.*RE.^3.* ...
  T.^5+24.*eta.^3.*gamma.^4.*RE.^3.*T.^5+24.*eta.^2.*gamma.^5.* ...
  RE.^3.*T.^5+(-24).*eta.^3.*gamma.^5.*RE.^3.*T.^5+(-2).*eta.^3.* ...
  gamma.^3.*T.^6+(-6).*eta.^2.*gamma.^4.*T.^6+12.*eta.^3.*gamma.^4.* ...
  T.^6+(-6).*eta.*gamma.^5.*T.^6+24.*eta.^2.*gamma.^5.*T.^6+(-24).* ...
  eta.^3.*gamma.^5.*T.^6+(-2).*gamma.^6.*T.^6+12.*eta.*gamma.^6.* ...
  T.^6+(-24).*eta.^2.*gamma.^6.*T.^6+16.*eta.^3.*gamma.^6.*T.^6+6.* ...
  eta.^3.*gamma.^3.*RE.*T.^6+12.*eta.^2.*gamma.^4.*RE.*T.^6+(-36).* ...
  eta.^3.*gamma.^4.*RE.*T.^6+6.*eta.*gamma.^5.*RE.*T.^6+(-48).* ...
  eta.^2.*gamma.^5.*RE.*T.^6+72.*eta.^3.*gamma.^5.*RE.*T.^6+(-12).* ...
  eta.*gamma.^6.*RE.*T.^6+48.*eta.^2.*gamma.^6.*RE.*T.^6+(-48).* ...
  eta.^3.*gamma.^6.*RE.*T.^6+(-6).*eta.^3.*gamma.^3.*RE.^2.*T.^6+( ...
  -6).*eta.^2.*gamma.^4.*RE.^2.*T.^6+36.*eta.^3.*gamma.^4.*RE.^2.* ...
  T.^6+24.*eta.^2.*gamma.^5.*RE.^2.*T.^6+(-72).*eta.^3.*gamma.^5.* ...
  RE.^2.*T.^6+(-24).*eta.^2.*gamma.^6.*RE.^2.*T.^6+48.*eta.^3.* ...
  gamma.^6.*RE.^2.*T.^6+2.*eta.^3.*gamma.^3.*RE.^3.*T.^6+(-12).* ...
  eta.^3.*gamma.^4.*RE.^3.*T.^6+24.*eta.^3.*gamma.^5.*RE.^3.*T.^6+( ...
  -16).*eta.^3.*gamma.^6.*RE.^3.*T.^6+(gamma.^6.*T.^6.*((eta.*(9+( ...
  -9).*eta+2.*eta.^2)+3.*(eta.*((-3)+6.*eta+(-2).*eta.^2)+(15+(-24) ...
  .*eta+4.*eta.^2+4.*eta.^3).*gamma).*T+3.*(eta.^2.*((-3)+2.*eta)+( ...
  -2).*eta.*((-6)+eta+4.*eta.^2).*gamma+((-21)+32.*eta+(-20).* ...
  eta.^2+8.*eta.^3).*gamma.^2).*T.^2+(-2).*(eta+gamma+(-2).*eta.* ...
  gamma).^3.*T.^3+(-2).*RE.^3.*((-1)+eta+eta.*((-1)+2.*gamma).*T) ...
  .^3+(-3).*RE.*((-3)+6.*eta+(-5).*eta.^2+2.*eta.^3+((-2).*eta.*(3+( ...
  -5).*eta+3.*eta.^2)+(6+(-5).*eta+(-12).*eta.^2+12.*eta.^3).*gamma) ...
  .*T+(eta.^2.*((-5)+6.*eta)+(-1).*eta.*(1+(-16).*eta+24.*eta.^2).* ...
  gamma+2.*((-7)+23.*eta+(-24).*eta.^2+12.*eta.^3).*gamma.^2).*T.^2+ ...
  2.*eta.*((-1)+2.*gamma).*(eta+gamma+(-2).*eta.*gamma).^2.*T.^3)+ ...
  3.*RE.^2.*(2.*((-1)+eta).^2.*eta+((-1)+eta).*(2.*(1+(-3).*eta).* ...
  eta+(5+(-12).*eta+12.*eta.^2).*gamma).*T+eta.*((-1)+2.*gamma).*( ...
  2.*(2+(-3).*eta).*eta+(7+(-18).*eta+12.*eta.^2).*gamma).*T.^2+2.* ...
  eta.^2.*(1+(-2).*gamma).^2.*((-1).*eta+((-1)+2.*eta).*gamma).* ...
  T.^3)).^2+(-4).*(3+(-3).*eta+3.*(eta+((-1)+2.*eta).*gamma.*((-1)+ ...
  RE)).*T+((-1).*eta+(eta+gamma+(-2).*eta.*gamma).*T+RE.*((-1)+eta+ ...
  eta.*((-1)+2.*gamma).*T)).^2).^3)).^(1/2)).^(-1/3)+2.^(2/3).* ...
  gamma.^(-2).*T.^(-2).*(9.*eta.*gamma.^3.*T.^3+(-9).*eta.^2.* ...
  gamma.^3.*T.^3+2.*eta.^3.*gamma.^3.*T.^3+9.*gamma.^3.*RE.*T.^3+( ...
  -18).*eta.*gamma.^3.*RE.*T.^3+15.*eta.^2.*gamma.^3.*RE.*T.^3+(-6) ...
  .*eta.^3.*gamma.^3.*RE.*T.^3+6.*eta.*gamma.^3.*RE.^2.*T.^3+(-12).* ...
  eta.^2.*gamma.^3.*RE.^2.*T.^3+6.*eta.^3.*gamma.^3.*RE.^2.*T.^3+2.* ...
  gamma.^3.*RE.^3.*T.^3+(-6).*eta.*gamma.^3.*RE.^3.*T.^3+6.*eta.^2.* ...
  gamma.^3.*RE.^3.*T.^3+(-2).*eta.^3.*gamma.^3.*RE.^3.*T.^3+(-9).* ...
  eta.*gamma.^3.*T.^4+18.*eta.^2.*gamma.^3.*T.^4+(-6).*eta.^3.* ...
  gamma.^3.*T.^4+45.*gamma.^4.*T.^4+(-72).*eta.*gamma.^4.*T.^4+12.* ...
  eta.^2.*gamma.^4.*T.^4+12.*eta.^3.*gamma.^4.*T.^4+18.*eta.* ...
  gamma.^3.*RE.*T.^4+(-30).*eta.^2.*gamma.^3.*RE.*T.^4+18.*eta.^3.* ...
  gamma.^3.*RE.*T.^4+(-18).*gamma.^4.*RE.*T.^4+15.*eta.*gamma.^4.* ...
  RE.*T.^4+36.*eta.^2.*gamma.^4.*RE.*T.^4+(-36).*eta.^3.*gamma.^4.* ...
  RE.*T.^4+(-6).*eta.*gamma.^3.*RE.^2.*T.^4+24.*eta.^2.*gamma.^3.* ...
  RE.^2.*T.^4+(-18).*eta.^3.*gamma.^3.*RE.^2.*T.^4+(-15).*gamma.^4.* ...
  RE.^2.*T.^4+51.*eta.*gamma.^4.*RE.^2.*T.^4+(-72).*eta.^2.* ...
  gamma.^4.*RE.^2.*T.^4+36.*eta.^3.*gamma.^4.*RE.^2.*T.^4+6.*eta.* ...
  gamma.^3.*RE.^3.*T.^4+(-12).*eta.^2.*gamma.^3.*RE.^3.*T.^4+6.* ...
  eta.^3.*gamma.^3.*RE.^3.*T.^4+(-12).*eta.*gamma.^4.*RE.^3.*T.^4+ ...
  24.*eta.^2.*gamma.^4.*RE.^3.*T.^4+(-12).*eta.^3.*gamma.^4.*RE.^3.* ...
  T.^4+(-9).*eta.^2.*gamma.^3.*T.^5+6.*eta.^3.*gamma.^3.*T.^5+36.* ...
  eta.*gamma.^4.*T.^5+(-6).*eta.^2.*gamma.^4.*T.^5+(-24).*eta.^3.* ...
  gamma.^4.*T.^5+(-63).*gamma.^5.*T.^5+96.*eta.*gamma.^5.*T.^5+(-60) ...
  .*eta.^2.*gamma.^5.*T.^5+24.*eta.^3.*gamma.^5.*T.^5+15.*eta.^2.* ...
  gamma.^3.*RE.*T.^5+(-18).*eta.^3.*gamma.^3.*RE.*T.^5+3.*eta.* ...
  gamma.^4.*RE.*T.^5+(-48).*eta.^2.*gamma.^4.*RE.*T.^5+72.*eta.^3.* ...
  gamma.^4.*RE.*T.^5+42.*gamma.^5.*RE.*T.^5+(-138).*eta.*gamma.^5.* ...
  RE.*T.^5+144.*eta.^2.*gamma.^5.*RE.*T.^5+(-72).*eta.^3.*gamma.^5.* ...
  RE.*T.^5+(-12).*eta.^2.*gamma.^3.*RE.^2.*T.^5+18.*eta.^3.* ...
  gamma.^3.*RE.^2.*T.^5+(-21).*eta.*gamma.^4.*RE.^2.*T.^5+78.* ...
  eta.^2.*gamma.^4.*RE.^2.*T.^5+(-72).*eta.^3.*gamma.^4.*RE.^2.* ...
  T.^5+42.*eta.*gamma.^5.*RE.^2.*T.^5+(-108).*eta.^2.*gamma.^5.* ...
  RE.^2.*T.^5+72.*eta.^3.*gamma.^5.*RE.^2.*T.^5+6.*eta.^2.* ...
  gamma.^3.*RE.^3.*T.^5+(-6).*eta.^3.*gamma.^3.*RE.^3.*T.^5+(-24).* ...
  eta.^2.*gamma.^4.*RE.^3.*T.^5+24.*eta.^3.*gamma.^4.*RE.^3.*T.^5+ ...
  24.*eta.^2.*gamma.^5.*RE.^3.*T.^5+(-24).*eta.^3.*gamma.^5.*RE.^3.* ...
  T.^5+(-2).*eta.^3.*gamma.^3.*T.^6+(-6).*eta.^2.*gamma.^4.*T.^6+ ...
  12.*eta.^3.*gamma.^4.*T.^6+(-6).*eta.*gamma.^5.*T.^6+24.*eta.^2.* ...
  gamma.^5.*T.^6+(-24).*eta.^3.*gamma.^5.*T.^6+(-2).*gamma.^6.*T.^6+ ...
  12.*eta.*gamma.^6.*T.^6+(-24).*eta.^2.*gamma.^6.*T.^6+16.*eta.^3.* ...
  gamma.^6.*T.^6+6.*eta.^3.*gamma.^3.*RE.*T.^6+12.*eta.^2.* ...
  gamma.^4.*RE.*T.^6+(-36).*eta.^3.*gamma.^4.*RE.*T.^6+6.*eta.* ...
  gamma.^5.*RE.*T.^6+(-48).*eta.^2.*gamma.^5.*RE.*T.^6+72.*eta.^3.* ...
  gamma.^5.*RE.*T.^6+(-12).*eta.*gamma.^6.*RE.*T.^6+48.*eta.^2.* ...
  gamma.^6.*RE.*T.^6+(-48).*eta.^3.*gamma.^6.*RE.*T.^6+(-6).* ...
  eta.^3.*gamma.^3.*RE.^2.*T.^6+(-6).*eta.^2.*gamma.^4.*RE.^2.*T.^6+ ...
  36.*eta.^3.*gamma.^4.*RE.^2.*T.^6+24.*eta.^2.*gamma.^5.*RE.^2.* ...
  T.^6+(-72).*eta.^3.*gamma.^5.*RE.^2.*T.^6+(-24).*eta.^2.* ...
  gamma.^6.*RE.^2.*T.^6+48.*eta.^3.*gamma.^6.*RE.^2.*T.^6+2.* ...
  eta.^3.*gamma.^3.*RE.^3.*T.^6+(-12).*eta.^3.*gamma.^4.*RE.^3.* ...
  T.^6+24.*eta.^3.*gamma.^5.*RE.^3.*T.^6+(-16).*eta.^3.*gamma.^6.* ...
  RE.^3.*T.^6+(gamma.^6.*T.^6.*((eta.*(9+(-9).*eta+2.*eta.^2)+3.*( ...
  eta.*((-3)+6.*eta+(-2).*eta.^2)+(15+(-24).*eta+4.*eta.^2+4.* ...
  eta.^3).*gamma).*T+3.*(eta.^2.*((-3)+2.*eta)+(-2).*eta.*((-6)+eta+ ...
  4.*eta.^2).*gamma+((-21)+32.*eta+(-20).*eta.^2+8.*eta.^3).* ...
  gamma.^2).*T.^2+(-2).*(eta+gamma+(-2).*eta.*gamma).^3.*T.^3+(-2).* ...
  RE.^3.*((-1)+eta+eta.*((-1)+2.*gamma).*T).^3+(-3).*RE.*((-3)+6.* ...
  eta+(-5).*eta.^2+2.*eta.^3+((-2).*eta.*(3+(-5).*eta+3.*eta.^2)+(6+ ...
  (-5).*eta+(-12).*eta.^2+12.*eta.^3).*gamma).*T+(eta.^2.*((-5)+6.* ...
  eta)+(-1).*eta.*(1+(-16).*eta+24.*eta.^2).*gamma+2.*((-7)+23.*eta+ ...
  (-24).*eta.^2+12.*eta.^3).*gamma.^2).*T.^2+2.*eta.*((-1)+2.*gamma) ...
  .*(eta+gamma+(-2).*eta.*gamma).^2.*T.^3)+3.*RE.^2.*(2.*((-1)+eta) ...
  .^2.*eta+((-1)+eta).*(2.*(1+(-3).*eta).*eta+(5+(-12).*eta+12.* ...
  eta.^2).*gamma).*T+eta.*((-1)+2.*gamma).*(2.*(2+(-3).*eta).*eta+( ...
  7+(-18).*eta+12.*eta.^2).*gamma).*T.^2+2.*eta.^2.*(1+(-2).*gamma) ...
  .^2.*((-1).*eta+((-1)+2.*eta).*gamma).*T.^3)).^2+(-4).*(3+(-3).* ...
  eta+3.*(eta+((-1)+2.*eta).*gamma.*((-1)+RE)).*T+((-1).*eta+(eta+ ...
  gamma+(-2).*eta.*gamma).*T+RE.*((-1)+eta+eta.*((-1)+2.*gamma).*T)) ...
  .^2).^3)).^(1/2)).^(1/3)).^(1/2);
end