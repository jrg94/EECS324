% Model for spread of Malaria
function model=malaria(t,x) % Dynamic Model
% x(1) = population of uninfected_humans at time t
% x(2) = population of human host at time t
% x(3) = population of Imnnunes at time t
% x(4) = population of uninfected_mosquitoes at time t
% x(5) = population of vectors at time t

r=0.3;      % Recovery rate per per human host
k=0.01;     % Immunity rate rate per human host
d=0.005;    % Malaria-induced death rate per human host
p1=0.3;     % Probability that an uninfected human will be bitten by a mosquito
b=0.01;     % Mosquito birth rate per mosquito
c=0.01;     % Mosquito death rate per mosquito
p4=0.3;     % Probability that a mosquito will bite a human

dx1=r*x(2)-p1*x(5)*x(1)/(x(4)+x(5));
dx2=p1*x(5)*x(1)/(x(4)+x(5))-(r+k+d)*x(2);
dx3=k*x(2);
dx4=b*(x(4)+x(5))-p4*x(2)*x(4)/(x(1)+x(2)+x(3))-c*x(4);
dx5=p4*x(2)*x(4)/(x(1)+x(2)+x(3))-c*x(5);

model=[dx1;dx2;dx3;dx4;dx5];