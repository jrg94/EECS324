function grid = initTimeGrid(n)
grid = ones(n+2, n+2);
% Initialize every grid square
for i = 2:n+1
    for j = 2:n+1
        grid(i, j) = 0;
    end
end