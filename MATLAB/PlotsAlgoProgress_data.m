%% Parameters
alpha       = 2;         % Input coherent state amplitude
gamma       = 0.90;      % Transmittance of the Loss channel (smaller gamma means more loss)
T           = 0.35;      % For ZPS (T = 1 is no ZPS)
eta         = 0.95;      % Detector efficiency
RE          = 0.00;      % Resource state preparation loss
n           = 0;
mt          = noiselessRescalenPS(T_eff(gamma, T, eta, RE), alpha, n);                        % Matrix that distorts the qubit due to ZPS and Teleamp. together.
Wmat        = WnPS(sqrt(T_eff(gamma, T, eta, RE))*alpha, gamma_eff(gamma, T, eta, RE),n);    % Process matrix for the effective loss channel
Nbasis      = noisebasisTable();                                                        % A table of vec(basis operators) for the effective loss channel
N           = Jw(Wmat, Nbasis);                                                         % Choi matrix for the effective loss channel
%% Metaparameters
epsilon     = +3;                                   % (+0.0050) positive for maximizing the worst-case-fidelity
seed        = randn(8)+1i*randn(8);                    % A random full rank complex matrix. It is not a CPTP.      
seed        = (seed'*seed)/trace(seed'*seed);       % trace normalizing
R           = CPTP(seed);                           % Makes it CPTP. 
%% Main
[ygdconA, R , diffRlist, Flist, gradlist]     = gdconA(R, mt, N, epsilon);
%% Saving data
% save('Backup values/Flist ALPHA2 ETA95 GAMMA90 T35 n0.mat',"Flist");
% save('Backup values/diffRlist ALPHA2 ETA95 GAMMA90 T35 n0.mat',"diffRlist");
% save('Backup values/gradlist ALPHA2 ETA95 GAMMA90 T35 n0.mat',"gradlist");
% save('Backup values/R ALPHA2 ETA95 GAMMA90 T35 n0.mat',"R");