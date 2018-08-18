function M = showAntGraphs(gridList)
%%% visualization
global EMPTY;
% EMPTY = 0;
% size of grid
n = size(gridList, 1);
maxChem = max(max(max(gridList(:, :, :))));
map = zeros(2 * maxChem + 2, 3);
% gray for cell with no ant
for i = 1:maxChem + 1
    amt = 1.0 - ((i - 1) * 0.5) / maxChem;
    map(i, :) = [amt, amt, amt];
end;
% red for cell with ant
for i = 1:maxChem + 1
    amt = 1.0 - ((i - 1) * 0.5) / maxChem;
    map(i + maxChem + 1, :) = [amt, 0, 0];
end;
gr = zeros(n, n);
colormap(map);
% number of grids
m = size(gridList, 3);
% extract chemical amoungs into a 2D array
for k = 1:m
    g = gridList(:, :, k);
    for i = 1:n
        for j = 1:n
            if g(i, j) == EMPTY
                gr(i, j) = g(i, j) + 1;
            else
                gr(i, j) = g(i, j) + maxChem + 2;
            end;
        end;
    end;
    image(gr)
    axis off
    axis square
    M(k) = getframe;
end;