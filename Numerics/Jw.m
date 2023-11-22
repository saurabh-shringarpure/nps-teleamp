function y = Jw(Wmat,Ebasis)
% Inputs:
% W:            Process matrix of the loss channel
% Ebasis:       matrix of basis operators
% Outputs:
% Choi matrix of the loss channel
y = TrX(Ebasis*kron(Wmat .',eye(8)),1,[8,8]);
end