%% worst-case fidelity due to 10.1103/PhysRevA.94.042332
function y = bergmannFwc(alpha, gamma)
fun                 = @(x) (bergmannF(x,alpha,gamma));
x0                  = [-1+2*rand,2*pi*rand];
lb                  = [-1, 0];
ub                  = [+1, 2*pi];    
A                   = [];
b                   = [];
Aeq                 = [];
beq                 = [];
nonlcon             = [];
options             = optimoptions(@fmincon, 'Display', 'off');
[~,y]               = fmincon(fun, x0, A, b, Aeq, beq, lb, ub, nonlcon, options);
end