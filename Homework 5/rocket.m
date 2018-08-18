% Model for spread of disease SARS
function model=rocket(t,x) % Dynamic Model
% x(1) = position of the meteor at time t
% x(2) = velocity of the meteor time t
% x(3) = acceleration of the meteor at time t

% Constants
I = 200;
m0 = 5000;
mr = 1000;
g = 9.81;
T = 60;
           
dx1 = x(2);                                     % Change in position
dx2 = ((I * g)/(x(3) + mr)) * (m0 / T);         % Change in velocity
dx3 = -(m0/T);                                  % Change in acceleration

model=[dx1;dx2;dx3];