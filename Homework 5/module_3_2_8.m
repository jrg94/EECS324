% A bungee jumper wants to have a "great ride," getting close to the ground
% without hitting it. Suppose the distance of the jumping bridge above a
% gorge is 80 m and the length of the cord is 30 m. Determine the most
% appropriate whole number spring constants for jumpers of masses 60kg,
% 70kg, and 80kg. Employ comparison graphs. Discuss your results.

t0=0;           % Initial time
tf=14;          % Final time
dt=0.1;         % Change in time 
n=(tf-t0)/dt;   % Number of discrete periods considered

x(:,1)=[80;0];   % Initialize x values
for t=1:n,
x(:,t+1)=x(:,t)+Slope(t,x(:,t),dt)*dt;
end

%plotting
T=[1:n+1];
plot(T, x(1,:), '-r', T, x(2,:), '-b');
title('Bungee');
ylabel('m');
xlabel('0.1*seconds');