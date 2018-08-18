% Model for spread of disease SARS
function model=meteor(t,x) % Dynamic Model
% x(1) = position of the meteor at time t
% x(2) = velocity of the meteor time t
% x(3) = acceleration of the meteor at time t

% Constants
cod = 2;        % Coefficient of drag
m = 500;        % Mass of the meteor
d_i = 8000;     % Density of iron
d_s = 3000;     % Density of stone
g = 9.81;       % Gravity

% Variables
P = 0;          % Pressure
T = 0;          % Temperature

if x(1) > 82345
    T = -205.05 + .00164*x(1);
    P = 51.97 * ((T+459.7)/389.98)^-11.338;
elseif 36152 < x(1) < 82345
    T = -70;
    P = 473.1 * exp(1.73 - .000048 * x(1));
else
    T = 59 - .00356 * x(1);
    P = 2116 * ((T + 459.7)/518.6)^5.256
end
    
D = P / (1718 * (T + 459.7));   % Air density in english units

F_drag = .5 * cod * D * x(2) * x(2);
           
dx1 = x(2);              % Change in position
dx2 = (m * x(3) - F_drag) / m;     % Change in velocity

model=[dx1;dx2;0];