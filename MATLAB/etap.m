%% effective transmission after realistic 'noiseless' attenuation
function y = etap(T, eta)
    y = T/(1-eta*(1-T));
end