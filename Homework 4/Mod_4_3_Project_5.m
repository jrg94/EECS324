% Complete the Lipstitch SARS model introduced in the text. Have the model
% evaluate R. Produce graphs and a table of appropriate populations,
% including susceptible, recovered_immune, SARS_death, and the total of the
% five categories of infecteds. Employ the following parameters: k =
% 10/day; b = 0.06; 1/p = 5 days; v = 0.04, m = 0.0975, and w = 0.0625, so
% that v + m + w = 0.2/day and 1/(v + m + w) = 5 days; 1/u = 10 days; No = 
% 10,000,000 people. Vary q from 0 upward. Note that in each case, the
% graph of the number of susceptibles appears logistic and the solution
% eventually reachs equilibrium. Describe the shapes of the graphs and
% discuss the results.

t0=0;           % Initial time
tf=14;          % Final time
dt=0.1;         % Change in time 
n=(tf-t0)/dt;   % Number of discrete periods considered

x(:,1)=[10000000;0;0;0;0;0;0;0;0];   % Initialize x values
for t=1:n,
x(:,t+1)=x(:,t)+Slope(t,x(:,t),dt)*dt;
end

%plotting
T=[1:n+1];
plot(T, x(1,:), '-b', T, x(2,:), '-b', T, x(3,:), '-g', T, x(4,:), '-g', T, x(5,:), '-r', T, x(6,:), '-r', T, x(7,:), '-r', T, x(8,:), '-p', T, x(9,:), '-y');
title('Populations');
ylabel('Population Level');
xlabel('0.1*days');