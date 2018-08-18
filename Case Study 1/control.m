function u_at_t=control(t)
%pursuit problem
tb=[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14];
xb=[90 102 115 127 138 149 162 174 184 193 206 223 235 247 256];
yb=[0 -7 -12 -16 -22 -30 -38 -27 -29 -22 -15 -19 -11 -6 -12];
u_at_t=[interp1(tb,xb,t);interp1(tb,yb,t)];