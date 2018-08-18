function xdot=modelu(x,ut,t)
%lead-pursuit problem with alpha = 2 degree, and VF=25 km/minute
alpha=0/pi;VF=25;bomber=ut;
d=norm(bomber-x);
cosine=((bomber(1)-x(1))*cos(alpha)+(bomber(2)-x(2))*sin(alpha))/d;
sine=((bomber(2)-x(2))*cos(alpha)-(bomber(1)-x(1))*sin(alpha))/d;
xdot=[VF*cosine;VF*sine];