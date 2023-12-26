%% generates a cell array of indexed arrangements distrbution N objects in R bins s.t. all bins are non-empty
function arrangements = generateArrangements(N, R, index, arrangement, arrangements)
    if R == 0
        if N == 0
            arrangements{end+1} = arrangement;
            return;
        else
            return;
        end
    end
    
    for i = 0:N
        new_arrangement = [arrangement i+1];
        arrangements = generateArrangements(N - i, R - 1, index + 1, new_arrangement, arrangements);
    end
end