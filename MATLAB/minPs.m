function [minval, xopt]  = minPs(alpha, gamma, T, eta, RE, n, X1, X2, X3)
% alpha:    initial coherent state amplitude
% gamma:    channel transmission of the lossy channel
% T:        beamsplitter transmittance used for the noiseless attenuation
% eta:      detector efficiency
% RE:       resource-state (|Phi>) preparation loss
% n:        number of photons subtracted
% Xi:       photons detected in the relevant ancilla modes in tele-amp
samples             = 20;                   % number of samples of the input state for the minimization
list                = zeros(3, samples);    % this will store the list of states and corresponding minimum probability
x0                  = [-1+2*randn(1,samples);2*pi*randn(1,samples)];    % list of random input states

for k = 1:samples
    fun                 = @(x) (Ps(x, alpha, gamma, T, eta, RE, n, X1, X2, X3));
    lb                  = [-1;  0];         % lowerbounds for [x(1), x(2)]
    ub                  = [+1;  2*pi];      % upperbounds for [x(1), x(2)]
    A                   = [];
    b                   = [];
    Aeq                 = [];
    beq                 = [];
    nonlcon             = [];
    options             = optimoptions(@fmincon, 'Display', 'off');
    [xres,min_P]        = fmincon(fun, x0(:,k), A, b, Aeq, beq, lb, ub, nonlcon, options);
    list(:,k)           = [xres;min_P];
end
[minval,idx]            = min(list(3,:));
xopt                    = [list(1,idx);list(2,idx)];
x1              = xopt;
x2              = [-xopt(1); 2*pi-xopt(2)];
P1              = Ps(x1, alpha, gamma, T, eta, RE, n, X1, X2, X3);
P2              = Ps(x2, alpha, gamma, T, eta, RE, n, X1, X2, X3);
if (P2 < P1)    % checking the antipodal point on the Bloch sphere for the min
    minval  = P2;
    xopt    = x2;
end
end