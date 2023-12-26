%% generates a cell array of indexed arrangements distrbution N objects in R bins s.t. all bins contain atleast Nmin and atmost Nmax objects
function arrangements = generateArrangementsWithConstraints(N, R, photonsLeft, Nmin, Nmax, arrangement, arrangements)
    if R == 0
        if photonsLeft == 0
            arrangements{end+1} = arrangement;
            return;
        else
            return;
        end
    end
    
    for i = Nmin:min(Nmax, photonsLeft)
        new_arrangement = [arrangement i];
        arrangements = generateArrangementsWithConstraints(N, R - 1, photonsLeft - i, Nmin, Nmax, new_arrangement, arrangements);
    end
end