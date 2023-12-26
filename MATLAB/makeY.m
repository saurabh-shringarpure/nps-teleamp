%% makes array of (arrays of y-axes for various plots) for various runs of the optimization
function [ylist,Rlist, diffRlistlist, Flistlist] = makeY(alpha, gamma, T, eta, RE ,epsilon, runs)
% alpha:    initial coherent state amplitude
% gamma:    channel transmission of the lossy channel
% T:        beamsplitter transmittance used for the noiseless attenuation
% eta:      detector efficiency
% RE:       resource-state (|Phi>) preparation loss
% epsilon:  step-size control parameter for the gradient acent
% runs:     number of runs of the non-convex optimization
%
% Characterizing the setup
mt          = noiselessRescale(T_eff(gamma, T, eta, RE), alpha);                        % matrix that distorts the qubit due to ZPS and Teleamp. together.
Wmat        = W(sqrt(T_eff(gamma, T, eta, RE))*alpha, gamma_eff(gamma, T, eta, RE));    % process matrix for the effective loss channel
Nbasis      = noisebasisTable();                                                        % a table of vec(basis operators) for the effective loss channel
N           = Jw(Wmat, Nbasis);                                                         % Choi matrix for the effective loss channel

ylist           = zeros(1, runs);
Rlist           = zeros(8,8, runs);
for k           = 1:runs
    seed        = randn(8)+1i*randn(8);             % a random full rank complex matrix. It is not a CPTP.
    seed        = (seed'*seed)/trace(seed'*seed);   % trace normalization
    R           = CPTP(seed);
    [F, R ,diffRlist, Flist]        = gdconA(R, mt, N, epsilon);
    ylist(k)                        = F;
    Rlist(:,:,k)                    = R;
    diffRlistlist(:,k)              = diffRlist;
    Flistlist(:, k)                 = Flist;       
end
end