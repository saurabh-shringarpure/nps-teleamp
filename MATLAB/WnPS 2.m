%% process matrix for a qubit encoded on cat states after nPS, passing through lossy channel
function y = WnPS(alpha, gamma, n)
 y = (1-mod(n,2))*Weven(alpha, gamma)+(mod(n,2))*Wodd(alpha, gamma);
end