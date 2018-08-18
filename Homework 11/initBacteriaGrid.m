function [ bacteriaGrid ] = initBacteriaGrid( m, n, probInitBacteria )
%INITBACTERIAGRID gives a bacteria grid that is EMPTY except the first column
% initBacteriaGrid( m,n,probInitBacteria ) returns a bacteria grid that is EMPTY except
% the first column, where the probability of a bacterium in a cell is probInitBacteria
global EMPTY BACTERIUM
bacteriaGrid = zeros(m, n) + EMPTY;
for i = 1:m
    if rand < probInitBacteria
        bacteriaGrid(i, 1) = BACTERIUM;
    end
end
end