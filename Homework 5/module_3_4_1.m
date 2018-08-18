% Complete the model of rocket motion described in this module and begun in
% Rocket. Plot position and velocity with respect to time. Obtain the
% maximum altitude and velocity. Try various parameter values, such as
% those for a hypothetical rocket with initial mass of 5000 kg, rocket mass
% of 1000 kg, burnout time of 60 s, and a specific impulse of 200. Also,
% consider values of real engines, such as those in Table 3.4.1 with code
% information. Write a discussion of the results. Augment your work by
% having a comparative plot of altitude and velocity versus time for
% various rocket masses. Discuss the impact of various rocket masses on the
% altitude and velocity at burnout. Similarly, investigate the impact of
% various specific impulses.

t0=0;           % Initial time
tf=60;          % Final time
dt=0.1;         % Change in time 
n=(tf-t0)/dt;   % Number of discrete periods considered

x(:,1)=[0;0;0];   % Initialize x values
for t=1:n,
x(:,t+1)=x(:,t)+Slope(t,x(:,t),dt)*dt;
end

%plotting
T=[1:n+1];
plot(T, x(1,:), '-r', T, x(2,:), '-b');
title('Rocket');
ylabel('meters');
xlabel('0.1*seconds');