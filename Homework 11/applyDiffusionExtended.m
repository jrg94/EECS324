function pherGrid = applyDiffusionExtended(matExt, diffusionRate)
n = length(matExt) - 2;
pherGrid = matExt;
for i = 2:n+1
    for j = 2:n+1
        site = matExt(i, j);
        N = matExt(i-1, j);
        NE = matExt(i-1, j+1);
        E = matExt(i, j+1);
        SE = matExt(i+1, j+1);
        S = matExt(i+1, j);
        SW = matExt(i+1, j-1);
        W = matExt(i, j-1);
        NW = matExt(i-1, j-1);
        pherGrid(i, j) = diffusionPher(diffusionRate, site, N, NE, E, SE, S, SW, W, NW);
    end
end