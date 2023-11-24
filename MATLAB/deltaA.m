function y = deltaA(epsilon, M, R)
        y = epsilon*0.5*(M -0.5*kron(TrX(M*R+R*M,2,[4,2]),eye(2)));
end