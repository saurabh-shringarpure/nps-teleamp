%% combinations of distributing N objects in R bins such that each bin is non-empty.
function arrangements = combs(N, R)
    arrangements = cell(0);
    arrangements = generateArrangements(N-R, R, 1, [], arrangements);
end