%% sum of min (over all x) of success probabilities of nPS and teleamp where only single-photons are accepted in each relevant mode
function y = sum_allnPS_minPs(alpha, gamma, T, eta, RE, max_n)
    y = 0;
    for k = 0:max_n
        y = y + minPS(alpha, gamma, T, eta, RE, k, 1, 1, 1); 
    end
end