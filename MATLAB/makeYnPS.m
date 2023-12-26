%% makes array of (arrays of y-axes for various plots) for various runs of the optimization
function [ylist,Rlist, diffRlistlist, Flistlist, gradlistlist] = makeYnPS(alpha, gamma, T, eta, RE ,epsilon, runs, n)
% alpha:    initial coherent state amplitude
% gamma:    channel transmission of the lossy channel
% T:        beamsplitter transmittance used for the noiseless attenuation
% eta:      detector efficiency
% RE:       resource-state (|Phi>) preparation loss
% epsilon:  step-size control parameter for the gradient acent
% runs:     number of runs of the non-convex optimization
% n:        photons subtracted
%
% characterizing the setup
mt              = noiselessRescalenPS(T_eff(gamma, T, eta, RE), alpha,n);                        % matrix that distorts the qubit due to ZPS and Teleamp. together.
Wmat            = WnPS(sqrt(T_eff(gamma, T, eta, RE))*alpha, gamma_eff(gamma, T, eta, RE),n);    % process matrix for the effective loss channel
Nbasis          = noisebasisTable();                                                        % a table of vec(basis operators) for the effective loss channel
N               = Jw(Wmat, Nbasis);                                                         % Choi matrix for the effective loss channel
% compiling results from various runs
ylist           = zeros(1, runs);
Rlist           = zeros(8,8, runs);
for k           = 1:runs
    seed        = randn(8)+1i*randn(8);             % a random full rank complex matrix. It is not a CPTP.
    seed        = (seed'*seed)/trace(seed'*seed);   % trace normalization
    R           = CPTP(seed);
    [F, R ,diffRlist, Flist, gradlist]  = gdconA(R, mt, N, epsilon);
    ylist(k)                        = F;
    Rlist(:,:,k)                    = R;
    diffRlistlist(:,k)              = diffRlist;
    Flistlist(:, k)                 = Flist;
    gradlistlist(:,k)               = gradlist;  
end
end