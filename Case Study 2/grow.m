function [ bacGrid ] = grow( bacteriaGrid, nutritionGrid, p )
%GROW gives a new bacteria grid accounting for the growth of the Bacteria
% grow( bacteriaGrid, nutritionGrid, p ) returns a new bacteria grid that accounts for growth and death of bacteria in
relation to nutrition and a partial probability p
global BACTERIUM DEAD
bacGrid = bacteriaGrid;
m = size(nutritionGrid, 1); n = size(nutritionGrid, 2);
extBacGrid = extendBacteriaGrid(bacteriaGrid);
extNutGrid = extendNutrientGrid(nutritionGrid);
% disp(size(nutritionGrid)); % disp(size(extNutGrid)); % disp(size(bacteriaGrid)); %disp(size(extBacGrid));
for i= 2:m+1
    for j= 2:n+1
        if extBacGrid (i, j) == BACTERIUM
            if extNutGrid(i, j) <= 0
                bacGrid(i-1, j-1)= DEAD;
            elseif rand < p * extNutGrid(i, j)
                [newi, newj] = pickNeighbor(i, j, m, extBacGrid(i-1, j),...
                extBacGrid(i, j+1),extBacGrid(i+1,j), extBacGrid(i,j-1));
                bacGrid(newi,newj) = BACTERIUM;
            end
        end
    end
end