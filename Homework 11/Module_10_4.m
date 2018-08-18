% Module 10.4.4 - Jeremy Griffith
% Develop a simulation with a nest, a food source, and ants that should not
% collide on a 20x20 grid. A sequence of 10 numbered ants leave the nest to
% search of food. Once an ant finds food, she returns to the nest carrying
% a morsel and depositing pheromones, with greater amounts closer to the
% food source. An ant seeking food, usually travels in a direction of
% maximum pheromone, but occasionally moves in a random direction. Have a
% large reinforcement threshold (e.g., 0.8 for pheromone values in the
% range of 0 to 1), a small diffusion constant (e.g., 0.005), and a small
% evaporation constant (e.g., 0.001 or less). Besides ants and pheromone
% grids, have a nest grid, where the strength of a nest signal is related
% to the distance from the nest and is greatest close to the nest. Run the
% simulation 10 times, and plot the mean length of time for each ant to
% find the food. Do ants that leave the nest later find the food faster?

global MAXPHER EVAPORATE DEPOSIT
MAXPHER = 50; EVAPORATE = 0.001; DEPOSIT = 2;
rand('state', 3); % seed random number generator
[antGrids, pherGrids] = ants(20, .05, .005, 10);
M = showGraphs(antGrids, pherGrids);