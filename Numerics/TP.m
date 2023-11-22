function y = TP(x)
    d = 2;
    M = kron(kron(eye(4),[1, 0]),kron(eye(4),[1, 0]))+kron(kron(eye(4),[0, 1]),kron(eye(4),[0, 1]));
    y = invec(vec(x)-(1/d)*(M'*M)*vec(x) +(1/d)*M'*vec(eye(4)));
end