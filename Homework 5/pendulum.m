% Model for a pendulum
function model=pendulum(t,x) % Dynamic Model
% x(1) = position of the meteor at time t
% x(2) = velocity of the meteor time t
% x(3) = acceleration of the meteor at time t

% Constants
g = 9.81;
m = 1;
k = 1;
l = 1;

dx1 = x(2);                                         % Change in position
dx2 = -(g/l) * sin(x(1)) - (k/(m * l)) * x(2);      % Change in velocity

model=[dx1;dx2;0];