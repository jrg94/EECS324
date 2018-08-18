function surge=model(x,t)
% x(1) = Vt
% x(2) = Z

Zr = 3168;          % Reservoir height (m)
Zt = 3072;          % Turbine height (m)
p = 1000;           % Water density (kg * m3) 
g = 9.81;           % Gravity (m/s2) 
lt = 13580;         % Length of pressure tunnel (m) 
k = 4.1;            % Friction constant (sec2/m) 
Ap = .6;            % Pressure pipe (m2) 
At = 12;            % Pressure tunnel (m2)

% Tabular behavior for surge tank -> FWS(z)
Z = [3100, 3110, 3120, 3130, 3160, 3170, 3180, 3190, 3210];
FWS = [20, 20, 100, 40, 40, 80, 80, 10, 10];
FWSz = interp1(Z, FWS, x(2));

% Sclosing(t)
tc = [0, 5, 20];
sc = [1, .17, 0];

% Sopening(t)
to = [0, 5, 15, 20, 30, 35];
so = [0, .4, .4, .8, .8, 1];

% Interpolate
St = interp1(to, so, t);

Vtrate = (g/lt)*(Zr - x(2) - k*g*x(1)*abs(x(1)));
Zrate = (At/FWSz(1))*x(1) + (Ap/FWSz(1))*St*(2*g*(Zr-Zt))^(1/2);
Pi = p*lt*Vtrate;

surge = [Vtrate;Zrate;Pi];