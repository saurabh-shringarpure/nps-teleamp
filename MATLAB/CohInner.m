%% Inner product between coherent states beta and alpha.
function y = CohInner(beta, alpha)
y = exp(1).^((1/2).*((-1).*abs(alpha).^2+(-1).*abs(beta).^2+2.*alpha.* ...
  conj(beta)));
end