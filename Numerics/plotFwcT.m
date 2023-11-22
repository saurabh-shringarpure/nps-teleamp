function Y = plotFwcT(alpha, T_i, T_f, eta, RE ,gamma,  pts ,epsilon)
    X = linspace(T_i, T_f ,pts);
    Y = zeros(1, pts);
    for k  = 1:pts
        Y(k) = max(makeY(alpha, gamma, X(k), eta, RE, epsilon));
    end
end