%% basis operators for the lossy channel
function y = noisebasis(j,k)
y =  vec(base(j)')*vec(base(k)')'; % base(l) are the basis operators for the recovery channel hence the complex conjugate
end