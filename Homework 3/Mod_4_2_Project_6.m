% Implement the model in Exercise 3 for the Antarctic, assuming the
% following:
% krill carrying capacity = 4x10^8tons
% krill birth rate = 5%
% blue whale growth rate = 10%
% yearly consumption of krill by a blue whale = 115 - 450 tons
% rate of blue whale consumption of krill = 1%
% Assume there are initially 5000 blue whales and 3 x 10^8 tons of krill
% and no other animal eats krill

t0=0; % Initial time in months
tf=36; % Final time
dt=0.1; % Change in time
n=(tf-t0)/dt; % number of discrete periods considered
x(:,1)=[100;15];

for t=1:n,
x(:,t+1)=x(:,t)+Slope(t,x(:,t),dt)*dt;
end

%plotting
T=[1:n+1];
plot(T,x(1,:),'-b',T,x(2,:),'-r')
title('Populations of Whales (blue) and Krill (red)')
ylabel('Poputation Level')
xlabel('0.1*months')