function newAntGrid = applySenseExtended(antGrid, pherGrid)
global EMPTY
n = length(antGrid) - 2;
newAntGrid = antGrid;
for i = 2:n+1
    for j = 2:n+1
        if (antGrid(i, j) ~= EMPTY)
            site = antGrid(i, j);
            Nant = antGrid(i-1, j);
            Eant = antGrid(i, j+1);
            Sant = antGrid(i+1, j);
            Want = antGrid(i, j-1);
            Npher = pherGrid(i-1, j);
            Epher = pherGrid(i, j+1);
            Spher = pherGrid(i+1, j);
            Wpher = pherGrid(i, j-1);
            newAntGrid(i, j) = sense(site, Nant, Eant, Sant, Want, Npher, Epher, Spher, Wpher);
        end
    end
end