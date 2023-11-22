function [minPs, xopt]  = min_success_probability(alpha, gamma, T, eta, RE)
    samples             = 20;
    list                = zeros(3, samples); 
    x0                  = [-1+2*randn(1,samples);2*pi*randn(1,samples)];

    for k = 1:samples
        fun                 = @(x) (success_probability(x, alpha, gamma, T, eta, RE));
        lb                  = [-1;  0];
        ub                  = [+1;  2*pi];
        A                   = [];
        b                   = [];
        Aeq                 = [];
        beq                 = [];
        nonlcon             = [];
        options             = optimoptions(@fmincon, 'Display', 'off');
        [xres,min_P]        = fmincon(fun, x0(:,k), A, b, Aeq, beq, lb, ub, nonlcon, options);
        list(:,k)           = [xres;min_P];
    end
    [minPs,idx]             = min(list(3,:)); 
    xopt                    = [list(1,idx);list(2,idx)];
    x1              = xopt;
    x2              = [-xopt(1); 2*pi-xopt(2)];
    P1              = success_probability(x1, alpha, gamma, T, eta, RE);
    P2              = success_probability(x2, alpha, gamma, T, eta, RE);
    if (P2 < P1) % checking the antipodal point
        minPs = P2;
        xopt  = x2;
    end
    y = minPs;
end