function xdot=model(x,t)
%Cat-and-Mouse
%d=sqrt(x(1)^2+(t-x(2)^2));
            %if (x(1)<=0)&(x(2)>=t)
            %    xdot=[0,0];
            %elseif d==0
            %    xdot=[0;0];
%if (x(1)<=0)
    %xdot=[0;2];
%else
    %xdot=[-2*x(1)/d;2*(t-x(2))/d];
%end
%HW9_F06_P4: Rocket to Mar
%xdot=[x(2);2/(330-t)-0.0037*(3394/(x(1)+3394))^2];

%HW9_F06_P1
%xdot=2*t*x^2;

%Chapra 18-1
%xdot=x*t^3-1.5*x;

%Chapra 18-7
%xdot=[-x(1)*2+5*x(2)*exp(-t);-x(1)*x(2)^2/2];

%Chapra 19.7
%xdot = [999*x(1) + 1999*x(2); -1000*x(1)-2000*x(2)];

% Satellite's geosynchronous orbit
xdot=[x(3);x(4);-6.672e-11*5.97e24*x(1)/(x(1)^2+x(2)^2)^(1.5);-6.672e-11*5.97e24*x(2)/(x(1)^2+x(2)^2)^(1.5)];

% Satellite's Earth-Moon orbit
%G=6.672e-11;Me=5.97e24;Mm=7.629e22;R=3.84e8;Ge=G*Me;Gm=G*Mm;d1=norm(x);d2=norm([x(1)-R;x(2)]);
%xdot=[x(3);x(4);-Ge*x(1)/d1^3-Gm*(x(1)-R)/d2^3;-Ge*x(2)/d1^3-Gm*x(2)/d2^3];