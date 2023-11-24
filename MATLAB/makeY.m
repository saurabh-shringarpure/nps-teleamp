function [ylist,Rlist, diffRlistlist, Flistlist] = makeY(alpha, gamma, T, eta, RE ,epsilon, runs)
% Characterizing the setup
mt          = noiselessRescale(T_eff(gamma, T, eta, RE), alpha);                        % Matrix that distorts the qubit due to ZPS and Teleamp. together.
Wmat        = W(sqrt(T_eff(gamma, T, eta, RE))*alpha, gamma_eff(gamma, T, eta, RE));    % Process matrix for the effective loss channel
Nbasis      = noisebasisTable();                                                        % A table of vec(basis operators) for the effective loss channel
N           = Jw(Wmat, Nbasis);                                                         % Choi matrix for the effective loss channel

ylist           = zeros(1, runs);
Rlist           = zeros(8,8, runs);
for k           = 1:samples
    seed        = randn(8)+1i*randn(8);                      % A random full rank complex matrix. It is not a CPTP.
    seed        = (seed'*seed)/trace(seed'*seed);           % trace normalizing
    R           = CPTP(seed);
    [ygdconA, R ,diffRlist, Flist]  = gdconA(R, mt, N, epsilon);
    ylist(k)                        = ygdconA;
    Rlist(:,:,k)                    = R;
    diffRlistlist(:,k)              = diffRlist;
    Flistlist(:, k)                 = Flist;       
end
end