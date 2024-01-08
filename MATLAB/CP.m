%% CP projection
function y = CP(x)
    x = reshape(x, [8,8]); 
    [V, D] = eig(x);
    D = D - min(0,D); % removes negative eigenvalues making a lower rank CP matrix
    y = V*D/V;
end