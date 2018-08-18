% Model the motion of a meteor falling to earth. Assume an initial height
% of 100,000 m, initial velocity of -10,000 m/s, coefficient of drag of 2,
% mass of 500kg, and density of 8000 kg/m3 for iron and 3500 kg/m3 for
% stone. Give graphs for position, velocity, and acceleration versus time.
% Give comparison graphs for velocity versus height for meteors of various
% masses. Similarly, give comparison graphs for acceleration versus height.
% NASA's Glenn Research Center gives the following model for air density
% using variables D for density, P for pressure, T for temperature, and h
% for altitude:
%
% D = P/ (1718 * (T + 459.7)
% 
% where 
%
% for h > 82,345 ft, T = -205.05 + .00164h, and P = 51.97((T+459.7)/389.98)^-11.338
%
% for 36,152 < h < 82,345 ft, T = -70, and P = 473.1e^(1.73 - .000048h)
%
% for h < 36,152 ft, T = 59 - .00356h, and P = 2116((T + 459.7)/518.6)^5.256
%
% If you wish to use metric instead of english units, you can use the
% following: 1 slug = 14.5939 kg and 1 ft = 0.3048 m

t0=0;           % Initial time
tf=10;          % Final time
dt=0.1;         % Change in time 
n=(tf-t0)/dt;   % Number of discrete periods considered

x(:,1)=[100000;-10000;9.81];   % Initialize x values
for t=1:n,
x(:,t+1)=x(:,t)+Slope(t,x(:,t),dt)*dt;
end

%plotting
T=[1:n+1];
plot(T, x(1,:), '-r', T, x(2,:), '-b', T, x(3,:), '-g');
title('Meteor');
ylabel('ft');
xlabel('0.1*seconds');