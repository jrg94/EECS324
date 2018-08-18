% Run the simulation for the following situations. Describe and explain the
% long-term results:
% 1. Various initial values of stocks
% 2. Slightly higher birth rate than death rate for mosquitos
% 3. No human host and one vector
% 4. Zero death rate for humans
% 5. Probability that a human is bitten reduced by a factor of 10 to 3%
% 6. Probability that a mosquito bites a human reduced by a factor of 10 to
% 3%

t0 = 0;         % Initial day
tf = 200;       % Final day
dt=1;           % Time increment
n=(tf-t0)/dt;   % Number of discrete periods considered

x(:,1)=[300;1;0;300;0];
for t=1:n,
x(:,t+1)=x(:,t)+Slope(t,x(:,t),dt)*dt;
end

% Plotting
T=[1:n+1];
plot(T,x(1,:),'-b',T,x(2,:),'-r', T,x(3,:),'-g',T,x(4,:),'.b',T,x(5,:),'.-r')
axis([0 200 0 350])
title('Populations of Humans and Mosquitoes')
ylabel('Poputation Level')
xlabel('days')
text(60,150,'Uninfected Humans')
text(120,60,'Human hosts')
text(165,140,'Immunes')
text(100,15,'Uninfected Mosquitoes')
text(100,285,'Vectors')