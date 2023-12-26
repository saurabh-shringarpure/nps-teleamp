function y = noiselessRescalenPS(T, alpha, n)
y = [(1-mod(n,2))*(1-mod(n/2,2))/normalization(0,0,sqrt(T)*alpha)+(mod(n,2))*(1-mod((n-1)/2,2))/normalization(0,1,sqrt(T)*alpha),...
    (1-mod(n,2))*(mod(n/2,2))/normalization(0,0,sqrt(T)*alpha)+(mod(n,2))*(mod((n-1)/2,2))/normalization(0,1,sqrt(T)*alpha);
    (1-mod(n,2))*(mod(n/2,2))/normalization(1,0,sqrt(T)*alpha)+(mod(n,2))*(mod((n-1)/2,2))/normalization(1,1,sqrt(T)*alpha),...
    (1-mod(n,2))*(1-mod(n/2,2))/normalization(1,0,sqrt(T)*alpha)+(mod(n,2))*(1-mod((n-1)/2,2))/normalization(1,1,sqrt(T)*alpha)];
y = y*[normalization(0,0,alpha),0;0,normalization(1,0,alpha)];
end