%% fidelity minimized over all pure initial states for a particular recovery R
function [xopt, Fwc, list] = innerOpt(R, mt, N)
% R:    Choi matrix for the recovery
% mt:   matrix that distorts the input qubit due to ZPS
% N:    Choi matrix for the noise channel

samples             = 20;                   % number of samples of the input state for the minimization
list                = zeros(3, samples);    % this will store the list of states and corresponding minimum fidelity
x0                  = [-1+2*randn(1,samples);2*pi*randn(1,samples)]; % list of random input states

for k = 1:samples
    fun                 = @(x) (+obj(x, R, mt, N)); % fidelity for the input state x
    lb                  = [-1;  0];                 % lowerbounds for [x(1), x(2)]
    ub                  = [+1;  2*pi];              % upperbounds for [x(1), x(2)]
    A                   = [];
    b                   = [];
    Aeq                 = [];
    beq                 = [];
    nonlcon             = [];
    options             = optimoptions(@fmincon, 'Display', 'off');
    [xres,minFidelity]  = fmincon(fun, x0(:,k), A, b, Aeq, beq, lb, ub, nonlcon, options);
    list(:,k)           = [xres;minFidelity];
end
[Fwc,idx]           = min(list(3,:)); 
xopt                = [list(1,idx);list(2,idx)];
x1              = xopt;
x2              = [-xopt(1),2*pi-xopt(2)];
F1              = obj(x1,R,mt,N);
F2              = obj(x2,R,mt,N);
if (F2 < F1)    % checking the antipodal point on the Bloch sphere for the min
    Fwc = F2;
    xopt = x2;
end
end