function [newAntGrid, newPherGrid] = walk(antGrid, pherGrid)
% WALK - Function to return a new ant and pheromone grids after each ant
% has moved or decided to remain in its current location
global EMPTY NORTH EAST SOUTH WEST STAY EVAPORATE THRESHOLD DEPOSIT
n = length(antGrid) - 2;
newAntGrid = antGrid; newPherGrid = pherGrid;
for i = 2:n+1
    for j = 2:n+1
        if(antGrid(i, j) == EMPTY)
            newPherGrid(i, j) = max([newPherGrid(i, j) - EVAPORATE, 0]);
        end
% else if can move in desired direction (no ant there now and no ant
% already planning to go there at the next time step), increment
% pheromone in site, make site empty, and change value in desired site
% to have ant and to point in the direction from where it came
        if(antGrid(i,j) == NORTH)
            if(newAntGrid(i-1,j) == EMPTY) % can move
                if(newPherGrid(i,j) > THRESHOLD)
                    newPherGrid(i,j) = newPherGrid(i,j) + DEPOSIT;
                end
                newAntGrid(i,j) = EMPTY;
                newAntGrid(i-1,j) = SOUTH;
            else
                newAntGrid(i,j) = STAY; % can't move
            end
        end
        if(antGrid(i,j) == EAST)
            if(newAntGrid(i,j+1) == EMPTY) % can move
                if(newPherGrid(i,j) > THRESHOLD)
                    newPherGrid(i,j) = newPherGrid(i,j) + DEPOSIT;
                end
                newAntGrid(i,j) = EMPTY;
                newAntGrid(i,j+1) = WEST;
            else
                newAntGrid(i,j) = STAY; % can't move
            end
        end
        if(antGrid(i,j) == SOUTH) % can move
            if(newAntGrid(i+1,j) == EMPTY)
                if(newPherGrid(i,j) > THRESHOLD)
                    newPherGrid(i,j) = newPherGrid(i,j) + DEPOSIT;
                end
                newAntGrid(i,j) = EMPTY;
                newAntGrid(i+1,j) = NORTH;
            else
                newAntGrid(i,j) = STAY; % can't move
            end
        end
        if(antGrid(i,j) == WEST) % can move
            if(newAntGrid(i,j-1) == EMPTY)
                if(newPherGrid(i,j) > THRESHOLD)
                    newPherGrid(i,j) = newPherGrid(i,j) + DEPOSIT;
                end
                newAntGrid(i,j) = EMPTY;
                newAntGrid(i,j-1) = EAST;
            else
            newAntGrid(i,j) = STAY; % can't move
            end
        end
    end
end