function [ nutGrid] = consumption( bacteriaGrid, nutritionGrid )
%CONSUMPTION gives a nutrition grid after consumption by bacteria
% consumption( bacteriaGrid, nutritionGrid ) returns a new
% nutritionGrid that accounts for the loss of nutrition to Bacteria
% consumption in the previous step.
global BACTERIUM CONSUMED
m = size (nutritionGrid, 1);
n = size(nutritionGrid, 2);
nutGrid = nutritionGrid;
for i= 1:m
    for j= 1:n
        if bacteriaGrid(i,j) == BACTERIUM
            nutGrid(i,j)= max(0.0, (nutGrid(i,j) - CONSUMED) );
        end
    end
end