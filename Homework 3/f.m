function model=f(t,x) % Dynamic Model
% model of competition between two species
% x(1) = population level of Krill at time t
% x(2) = population level of Whales at time t
m = 4e8; % Krill carrying capacity
k1 = .05; % Birth rate for krill
k12 = .01; % Death rate for krill (consumption rate)
k21=0.1; % Blue Whale growth rate
init_whales = 5000; % 5000 whales
init_krill = 3e8; % 3 x 10^8 tons of krill
model=[k1*(1 - x(1)/m) * x(1) - k12*x(2)*x(1); k21*(1 - x(2)/(k21*x(1))) * x(2)];