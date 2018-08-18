% Model the following chemical reaction, called the Oregonator, which
% oscillates in time:
%
% A + Y -> X: k1
% X + Y -> P: k2
% B + X -> 2X + Z: k3
% 2X -> Q: k4
% Z -> Y: k5
%
% where X is bromous acid, Y is bromide ion, and Z is cerium. Assume [A] 
% and [B] are constant and P and Q are inert. The original paper gave the
% the following constants: k1 = 1.34, k2 = 1.6 x 10^9, k3 = 8 x 10^3, k4 =
% 4 x 10^7, k5 = 1. For a variety of initial concentrations, graph the
% logarithms of [X], [Y], and [Z] versus time for at least 2000s. Verify
% that an equilibrium occurs at [X] = 2.45562 x 10^-8, [Y] = 2.99388 x
% 10^-7, and [Z] = 1.1787 x 10^-5. Explore the situations with initial
% conditions near equilibrium. Discuss the results.

t0=0;           % Initial time
tf=2500;        % Final time
dt=1;           % Change in time
n=(tf-t0)/dt;   % Number of discrete periods considered

x(:,1)=[100;100;100];
for t=1:n,
x(:,t+1)=x(:,t)+Slope(t,x(:,t),dt)*dt;
end

%plotting
T=[1:n+1];
plot(T,x(1,:),'-b',T,x(2,:),'-r', T,x(3,:),'-g')
axis([0 200 0 350])
title('Concentrations of X, Y, Z')
ylabel('Concentrations')
xlabel('seconds')