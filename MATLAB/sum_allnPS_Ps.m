%% sum of success probabilities of nPS and teleamp only single-photons are accepted in each relevant mode
function y = sum_allnPS_Ps(x, alpha, gamma, T, eta, RE, max_n)
    y = 0;
    for k = 0:max_n
        y = y + Ps(x, alpha, gamma, T, eta, RE, k, 1, 1, 1); 
    end
end