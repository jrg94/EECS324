function [newHIVGrid, newTimeGrid] = applyHIVExtended(hivGrid, timeGrid, probInfect, probReplace, rankLevel, probRespond)
n = length(hivGrid) - 2;
newHIVGrid = hivGrid;
newTimeGrid = timeGrid;
for i = 2:n+1
    for j = 2:n+1
            time = timeGrid(i, j);
            site = hivGrid(i, j);
            N = hivGrid(i-1, j);
            NE = hivGrid(i-1, j+1);
            E = hivGrid(i, j+1);
            SE = hivGrid(i+1, j+1);
            S = hivGrid(i+1, j);
            SW = hivGrid(i+1, j-1);
            W = hivGrid(i, j-1);
            NW = hivGrid(i-1, j-1);
            [newHIVGrid(i, j), newTimeGrid(i, j)] = testHIV(probInfect, probReplace, rankLevel, probRespond, site, time, N, NE, E, SE, S, SW, W, NW);
    end
end