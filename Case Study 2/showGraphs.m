function M = showGraphs(gridList)
%%% visualization
global HEALTHY DEAD INFECTEDA1 INFECTEDA2 BORDER;

% size of grid
n = size(gridList, 1);

% largest number on the grid
% maxHIV = max(max(max(gridList(:, :, :))));

% Generates the colormap full of zeroes
map = zeros(5, 3);

% A hardcoded set of colors corresponding to different cells
map(HEALTHY + 1, :) = [0.0, 1.0, 0.0];      % Green
map(DEAD + 1, :) = [0.0, 0.0, 0.0];         % Black
map(INFECTEDA1 + 1, :) = [0.8, 0.0, 0.0];   % Bright red
map(INFECTEDA2 + 1, :) = [0.5, 0.0, 0.0];   % Dark red
map(BORDER + 1, :) = [0.0, 0.0, 1.0];       % Blue

% Generates the image grid with zeros
gr = zeros(n, n);

% Assigns the colormap
colormap(map);

% number of grids
m = size(gridList, 3);

% Builds the image and displays it
for k = 1:m
    g = gridList(:, :, k);
    for i = 1:n
        for j = 1:n
            gr(i, j) = g(i, j) + 1;
        end;
    end;
    image(gr)
    colorbar
    axis off
    axis square
    M(k) = getframe;
    waitforbuttonpress;
end;