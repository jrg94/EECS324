function xdot=circuit2(x,t)

L1 = 0.2;
L2 = 1.0;
R1 = 10;
R2 = 220;
R3 = 330;
C1 = 0.1;
C2 = 1.0;
E = 117;

xdot = [x(2); -(1/(L1*C1))*x(1) - x(1)/(L2*C2) - ((R1+R2)*x(2))/L1 - (R3*x(2))/L2 + (E/(L1*C1)) + (E/(L2*C2))];