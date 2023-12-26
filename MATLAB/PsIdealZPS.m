%% success probability for ideal teleamp
function y = PsIdealZPS(x01, alpha, T)
a   = x01(1);
phi = x01(2);
b   = sqrt(1-x01(1).^2).*exp(1i.*phi);
% a, b are in 0, 1 basis

y = exp(1).^(alpha.^2+alpha.^2.*((-1)+T)+(-1).*alpha.^2.*T).*cosh( ...
  alpha.^2.*T).*sech(alpha.^2).*(1+2.*cos(alpha.^2).*real(a.* ...
  conj(b)).*sech(alpha.^2)).^(-1).*(1+2.*cos(alpha.^2.*T).*real( ...
  a.*conj(b)).*sech(alpha.^2.*T));
end