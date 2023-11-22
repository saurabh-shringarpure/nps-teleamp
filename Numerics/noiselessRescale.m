function y = noiselessRescale(T, alpha)
    y = [normalization(0,0,alpha)/normalization(0,0,sqrt(T)*alpha) ,0;0,normalization(1,0,alpha)/normalization(1,0,sqrt(T)*alpha)];
end