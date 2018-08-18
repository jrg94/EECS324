function xdot=fluid(x,t)

% Constants
R = 100;
k12 = 43;
k21 = 33;
k2 = 8;
V1 = 10;
V2 = 25;

% Function
xdot = [(R-k12*x(1)+k21*x(2))/V1;(k12*x(1)-k21*x(2)-k2*x(2))/V2];