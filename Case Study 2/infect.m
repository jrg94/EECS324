function [ hGrid ] = infect( hivGrid, nutritionGrid, p )
% INFECT gives a new bacteria grid accounting for the growth of the Bacteria
% grow( bacteriaGrid, nutritionGrid, p ) returns a new bacteria grid that 
% accounts for growth and death of bacteria in relation to nutrition and 
% a partial probability p
global HEALTHY INFECTEDA1 INFECTEDA2 DEAD
hGrid = hivGrid;
m = size(hivGrid, 1); n = size(hivGrid, 2);
% disp(size(nutritionGrid)); % disp(size(extNutGrid)); % disp(size(bacteriaGrid)); %disp(size(extBacGrid));
for i= 2:m+1
    for j= 2:n+1
        if hivGrid (i, j) == HEALTHY
            % Insert function that looks around this cell
        elseif hivGrid (i, j) == INFECTEDA1
        elseif hivGrid (i, j) == INFECTEDA2
        elseif hivGrid (i, j) == DEAD
        end
    end
end