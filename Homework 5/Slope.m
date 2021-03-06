function S=Slope(t,x,dt) %Slope calculator
n=length(x);
%calculating slope using Runge-Kutta 4th-order
S1=orbit(t,x);                  % Slope at t
S2=orbit(t+dt/2,x+S1*dt/2);     % Slope at t+dt/2 using S1 to estimate x(t+dt/2)
S3=orbit(t+dt/2,x+S2*dt/2);     % Slope at t+dt/2 using S2 to estimate x(t+dt/2)
S4=orbit(t+dt,x+S3*dt);         % Slope at t+dt using S3 to estimate x(t+dt)
S=(S1+2*S2+2*S3+S4)/6;         % Final estimate of the �SLOPE�--S