function [xopt, Fwc, list] = innerOpt(R, mt, N)
% Inputs:
% R:            Choi matrix of recovery
% mt:           Matrix that distorts the input qubit due to ZPS
% N:            Choi of noise
% Output
% fidelity minimized over all pure initial states for a particular
% recovery
samples             = 20;
list                = zeros(3, samples); 
%x0                  = [2*acos(-1+2*rand(1,samples));2*pi*rand(1,samples)];
x0                  = [-1+2*randn(1,samples);2*pi*randn(1,samples)];

for k = 1:samples
    fun                 = @(x) (+obj(x, R, mt, N));
    %lb                  = [0;  0];         % lower bounds on theta and phi 
    %ub                  = [pi; 2*pi];     % upper bounds on theta and phi
    lb                  = [-1;  0];
    ub                  = [+1;  2*pi];
    %lb                  = [-1;0];
    %ub                  = [+1;0];
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
if (F2 < F1) % checking the antipodal point
    Fwc = F2;
    xopt = x2;
end
end