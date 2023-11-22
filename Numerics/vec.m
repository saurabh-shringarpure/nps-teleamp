function y = vec(x)
    [d1, d2] = size(x);
    y = reshape(x, [d1*d2,1]);
end