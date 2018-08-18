% Model for spread of disease SARS
function model=sars(t,x) % Dynamic Model

b = 0.06;       % Probability that contact between infectious undetected 
                % and someone in susceptible results in transmission
k = 10;         % # of contacts per day
m = 0.0975;     % Per capita death
p = 0.2;        % Fraction per day of exposed people who become infectious
q = 0;          % Fraction per day of individuals in susceptible that have 
                % been exposed that go into quarantine
u = 0.1;        % Fraction per day of people in susceptible_quarantined
v = 0.04;       % Per capita recovery rate
w = 0.0625;     % Fraction per day of those in infectious_undetected who 
                % are detected and transferred to isolated
           
dx1 = u*x(2) - x(3) - q*x(2);       % Change in susceptible population
dx2 = x(1);                         % Change in susceptible_quarantined population
dx3 = k*x(1) - p*x(5);              % Change in exposed population
dx4 = x(1) - x(6);                  % Change in exposed_quarantined population
dx5 = x(3) - x(8) - v*x(9);         % Change in infectious_undetected population
dx6 = x(4) - x(7) - x(8) + v*x(9);  % Change in infectious_quarantined population
dx7 = w*x(5) + x(6) - v*x(9);       % Change in infectious_isolated population
dx8 = m*(w*x(5) + x(6) + x(7));     % Change in SARS_death population
dx9 = w*x(5) + x(6) + x(7);         % Change in recovered_immune population

model=[dx1;dx2;dx3;dx4;dx5;dx6;dx7;dx8;dx9];