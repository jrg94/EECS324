function hivGrids = hiv(n, probHIV, probInfect, probReplace, rankLevel, probRespond, t)
% hiv- Function to return a list of HIV grids in a simulation of HIV movement

hivGrid = initHIVGrid(n, probHIV);
hivGrids = zeros(n+2, n+2, t+1);
hivGrids(:, :, 1) = hivGrid; 
timeGrid = initTimeGrid(n);
timeGrids = zeros(n+2, n+2, t+1);
timeGrids(:, :, 1) = timeGrid;

% Runs the experiment t times
for i = 1:t
    [hivGrid, timeGrid] = applyHIVExtended(hivGrid, timeGrid, probInfect, probReplace, rankLevel, probRespond);
    hivGrids(:, :, i+1) = hivGrid; 
    timeGrids(:, :, i+1) = timeGrid;
    disp(timeGrid);
end