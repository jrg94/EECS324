function M = showGraphs(antGrids, pherGrids)
%%% visualization
global EMPTY; % EMPTY = 0;
% size of grid
n = size(antGrids, 1) - 2;
maxp = max(max(max(pherGrids(:, :, :))));
map = zeros(maxp + 2, 3);
% gray for cell with no ant
for i = 0:maxp
    siteColorAmt = 1.0 - i / maxp;
    map(i+1, :) = [siteColorAmt, siteColorAmt, siteColorAmt];
end;
% red for cell with ant
map(maxp + 2, :) = [1, 0, 0];
gr = zeros(n, n);
colormap(map);
% number of grids
m = size(antGrids, 3);
% extract chemical amounts into a 2D array
M = moviein(m);
for k = 1:m
    a = antGrids(:, :, k);
    p = pherGrids(:, :, k);
    for i = 2:n+1
        for j = 2:n+1
            if a(i, j) == EMPTY
                gr(i, j) = p(i, j) + 1;
            else
                gr(i, j) = maxp + 2;
            end;
        end;
    end;
    image(gr)
    axis off
    axis square
    M(k) = getframe;
end;