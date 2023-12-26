%% CP projection
function y = CP(x)
    x = reshape(x, [8,8]); 
    [U, S, V] = svd(x);
    S = S - min(0, min(S(:))); % removes negative singular values making a lower rank CP matrix
    y = U*S*V';
end