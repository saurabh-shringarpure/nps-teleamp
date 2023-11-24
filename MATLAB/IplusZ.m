function y = IplusZ(deltaA, R)
    y =(eye(8)+deltaA)/(kron(sqrtm(TrX((eye(8)+deltaA')*R*(eye(8)+deltaA),2,[4,2])),eye(2)));
end