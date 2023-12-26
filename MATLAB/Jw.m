%% Choi matrix of the loss channel
function y = Jw(Wmat,Ebasis)
% Wmat:     Process matrix of the loss channel
% Ebasis:   matrix of basis operators
y = TrX(Ebasis*kron(Wmat .',eye(8)),1,[8,8]);
end