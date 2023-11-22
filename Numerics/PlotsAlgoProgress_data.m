%% Parameters
alpha       = 2;         % Input coherent state amplitude
gamma       = 0.90;       % Transmittance of the Loss channel (smaller gamma means more loss)
T           = 0.50;       % For ZPS (T = 1 is no ZPS)
eta         = 0.95;      % Detector efficiency
RE          = 0.01;      % Resource state preparation loss

mt          = noiselessRescale(T_eff(gamma, T, eta, RE), alpha);                        % Matrix that distorts the qubit due to ZPS and Teleamp. together.
Wmat        = W(sqrt(T_eff(gamma, T, eta, RE))*alpha, gamma_eff(gamma, T, eta, RE));    % Process matrix for the effective loss channel
Nbasis      = noisebasisTable();                                                        % A table of vec(basis operators) for the effective loss channel
N           = Jw(Wmat, Nbasis);                                                         % Choi matrix for the effective loss channel
%% Metaparameters
epsilon     = +1;                                   % (+0.0050) positive for maximizing the worst-case-fidelity
seed        = randn(8)+1i*randn(8);                    % A random full rank complex matrix. It is not a CPTP.      
seed        = (seed'*seed)/trace(seed'*seed);       % trace normalizing
R           = CPTP(seed);                           % Makes it CPTP. 
%% Main
[ygdconA, R , diffRlist, Flist]     = gdconA(R, mt, N, epsilon);
%% Saving data
save('Backup values/Flist ALPHA2 ETA95 GAMMA90 T50.mat',"Flist");
save('Backup values/diffRlist ALPHA2 ETA95 GAMMA90 T50.mat',"diffRlist");
save('Backup values/R ALPHA2 ETA95 GAMMA90 T50.mat',"R");