function grid = initHIVGrid(n, probHIV)
% initialization of n+2-by-n+2 array for HIV simulation
% probHIV is the probability that a site has an infected-AI cell
global HEALTHY INFECTEDA1 INFECTEDA2 DEAD BORDER
HEALTHY = 0; 
INFECTEDA1 = 1;
INFECTEDA2 = 2;
DEAD = 3;
BORDER = 4;
grid = BORDER*ones(n+2, n+2);
% Initialize every grid square
for i = 2:n+1
    for j = 2:n+1
        if rand < probHIV
            grid(i, j) = INFECTEDA1;
        else
            grid(i, j) = HEALTHY;
        end
    end
end