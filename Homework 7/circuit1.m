function xdot=circuit1(x,t)

% Constants
E = 5000;
R = 100;
C = 32e-9;

% Function
xdot = [x(2); -x(1)/C - R*x(2) + E/C];