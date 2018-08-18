% Project 1 & 2
% Jeremy Griffith
%clear all

% Simulate 0-12 weeks
gridList = hiv(100, .05, 10e-5, .99, 6, .5, 12)
% M = showGraphs(gridList);

%clear all

% Simulate 0-12 years
%gridList = hiv(10, .05, .00001, .99, 624)
M = showGraphs(gridList);
