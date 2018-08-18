% Model for bungee jumping
function model=bungee(t,x) % Dynamic Model
% x(1) = position of the meteor at time t
% x(2) = velocity of the meteor time t
% x(3) = acceleration of the meteor at time t

% Constants
m1 = 50;
m2 = 60;
m3 = 70;
k1 = 50;
k2 = 60;
k3 = 70;
g = 9.81;
L = 30;

% Variables
w1 = m1 * g;
w2 = m2 * g;
w3 = m3 * g;

f1 = k1 * (x(1) - L);
f2 = k2 * (x(1) - L);
f3 = k3 * (x(1) - L);
           
dx1 = x(2);                 % Change in position
dx2 = (w3 - f3)/m3;          % Change in velocity

model=[dx1;dx2];