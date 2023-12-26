%% sum of success probabilities of nPS and teleamp where up to max_n photons are accepted in each relevant mode for a given state x
function y = sum_allnPSallTeleamp_Ps(x,alpha, gamma, T, eta, RE, max_n)
y = 0;
% kmax = 3*max_n-3;
% for k = 0:kmax
%     arrangements{k+1} = combsWithConstraints(3+k,3,1,max_n);
% end
% for n = 0:max_n
%     for j = 1:length(arrangements)
%         for k = 1:length(arrangements{j})
%             X   = arrangements{j}{k};
%             y   = y + Ps(x, alpha, gamma, T, eta, RE, n, X(1), X(2) ,X(3));
%         end
%     end
% end

for n = 0:max_n
    for X1 = 1: max_n
        for X2 = 1:max_n
            for X3 = 1:max_n
                y = y + Ps(x, alpha, gamma, T, eta, RE, n, X1, X2 ,X3);
            end
        end
    end
end
end