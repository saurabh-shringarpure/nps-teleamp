function y = invec(x)
   d1 = size(x,1);
   y = reshape(x, [sqrt(d1), sqrt(d1)]);
end