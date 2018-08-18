% Develop a model of a pendulum clock that completes a cycle in 1s. Assume 
% linear damping as modeled in Project 2. Have an impulse change the angular
% velocity by an appropriate fixed amount at the bottom of a swing in one
% direction. If available in your system dynamics tool, a delay function
% that returns the value of an argument in the previous time step might be
% helpful in determining when angle changes sign. Approximately how long
% does your model run before the clock runs down?

t0=0;           % Initial time
tf=10;          % Final time
dt=0.1;         % Change in time 
n=(tf-t0)/dt;   % Number of discrete periods considered

x(:,1)=[1;0;0];   % Initialize x values
for t=1:n,
x(:,t+1)=x(:,t)+Slope(t,x(:,t),dt)*dt;
end

%plotting
T=[1:n+1];
plot(T, x(1,:), '-r', T, x(2,:), '-b');
title('Pendulum');
ylabel('meters');
xlabel('0.1*seconds');