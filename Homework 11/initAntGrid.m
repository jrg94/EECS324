function grid = initAntGrid(n, probAnt)
% INITANTGRID - initialization of n+2-by-n+2 array for ant simulation
% probAnt is the probability that a site has an ant.
global EMPTY NORTH EAST SOUTH WEST STAY BORDER
EMPTY = 0; NORTH = 1; EAST = 2; SOUTH = 3; WEST = 4; STAY = 5; BORDER = 6;
grid = BORDER*ones(n+2, n+2);
for i = 2:n+1
    for j = 2:n+1
        if rand < probAnt
            grid(i, j) = randi(4);
        else
            grid(i, j) = EMPTY;
        end
    end
end