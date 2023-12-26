%% combinations of distributing N objects in R bins such that each bin has atleast Nmin objects and atmost Nmax objects
function arrangements = combsWithConstraints(N, R, Nmin, Nmax)
    arrangements = cell(0);
    arrangements = generateArrangementsWithConstraints(N, R, N, Nmin, Nmax, [], arrangements);
end