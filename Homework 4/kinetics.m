% Model for Oregonator
function model=kinetics(t,x) % Dynamic Model
% x(1) = [X] at time t
% x(2) = [Y] at time t
% x(3) = [Z] at time t

k1 = 1.34;
k2 = 1.6e9;
k3 = 8e3;
k4 = 4e7;
k5 = 1;

dx1 = k1*x(2);
p1 = k2*x(1)*x(2);

dx4 = k4*x(1)/2;
dx5 = k5*x(3);

dx = dx1 + dx4;
dy = dx5;
dz = -dx5;

model=[dx;dy;dz];
