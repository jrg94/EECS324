function [ bacGrids, nutGrids ] = biofilm( m, n, probInitBacteria, diffusionRate, p, t )
%BIOFILM returns a list of bacteria and nutrition grids for a biofilm simulation
% biofilm( m,n,probInitBacteria, diffusionRate, p, t) returns a list of bacteria grids and a list of nutrition grids in a
% simulation of the formation of the structure of a biofilm with one type of bacteria. In a bacteria grid, a cell value of
% EMPTY indicates the cell is empty; BACTERIUM, the cell contains a live bacterium; and DEAD, a dead bacterium. In
% a nutrition grid, cell values range from 0 (no nutrient) to 1. Furthermore, m, n are the rows and columns respectively,
% of the bacteria and nutrient grids. Also, probInitBacteria is the probability of a bacterium in an element of the initial
% bacteria grid's first column. Then, diffusionRate is the rate of diffusion of nutrients in the nutrient grid. Moreover, p is
% the constant (0 < p <=1) used in the calculation of the probability that a bacterium divides, (cell's nutrient
% value)*p/(sum of the nutrition values of each cell with bacterium in it). Finally, t is the number of time steps.
bacteriaGrid = initBacteriaGrid(m, n, probInitBacteria);
nutrientGrid = initNutrientGrid(m, n);
bacGrids = zeros(m, n, t+1);
bacGrids(:, :, 1) = bacteriaGrid;
nutGrids(:, :, 1) = nutrientGrid;
for i = 1:t
    extNutrientGrid = extendNutrientGrid(nutrientGrid);
    nutrientGrid = applyDiffusionExtended(extNutrientGrid, diffusionRate);
    bacteriaGrid = grow(bacteriaGrid, nutrientGrid, p);
    nutrientGrid = consumption(bacteriaGrid, nutrientGrid);
    bacGrids(:, :, i + 1) = bacteriaGrid;
    nutGrids(:, :, i + 1) = nutrientGrid;
end