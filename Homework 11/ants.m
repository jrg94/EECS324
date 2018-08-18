function [antGrids, pherGrids] = ants(n, probAnt, diffusionRate, t)
% ANTS - Function to return a list of ant and pheromone grids in a simulation of ant movement, where
% ant cell values are as in Table 10.4.1 and pheromone cell values represent the levels of pheromone
antGrid = initAntGrid(n, probAnt);
pherGrid = initPherGrid(n);
antGrids = zeros(n+2, n+2, t+1);
antGrids(:, :, 1) = antGrid;
pherGrids = zeros(n+2, n+2, t+1);
pherGrids(:, :, 1) = pherGrid;
for i = 1:t
    antGrid = applySenseExtended(antGrid, pherGrid);
    [antGrid, pherGrid] = walk(antGrid, pherGrid);
    pherGrid = applyDiffusionExtended(pherGrid, diffusionRate);
    antGrids(:, :, i+1) = antGrid;
    pherGrids(:, :, i+1) = pherGrid;
end