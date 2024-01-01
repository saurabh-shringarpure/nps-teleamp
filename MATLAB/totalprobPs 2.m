%% total probability when mode "A" is in vacuum, for a given input state x
function y = totalprobPs(x, alpha, gamma, T, eta, RE, max_n)
y = 0;
for n = 0:max_n
    for X1  = 1:max_n
        for X2  = 1:max_n
            for X3  = 1:max_n
                y = y + Ps(x, alpha, gamma, T, eta, RE, n, X1, X2, X3);
            end
        end
    end
end
end