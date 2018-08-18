% Develop a two-compartment model for Dilantin, where the rate of change of
% aborption from the stomach to the blood serum is proportional to the
% volume of the stomach and to the difference of the drug concentrations in
% the stomach and serum. Assume the volume of the stomach is 500mL.

dosage = 3e5 ; % micro-g every 8 hours, i.e. 300mg every 8 hours
volume = 500; % mL of the stomach
Absorption_constant = 0.12;
half_life = 22; % in hours
MEC = 10; % micro-gram/mL
MTC = 20; % micro-gram/mL
t0=0; 
tf=168; 
dt=1;
Q(1)=12*1e3;

% Start simulation by calculating Q(1), Q(2),…,Q(n).
for t=1:dt:168
S1=dilantin(t,Q(t), dosage, half_life);
S2=dilantin(t+dt/2,Q(t)+S1*dt/2, dosage, half_life);
S3=dilantin(t+dt/2,Q(t)+S2*dt/2, dosage, half_life);
S4=dilantin(t+dt,Q(t)+S3*dt, dosage, half_life);
S=(S1+2*S2+2*S3+S4)/6;
Q(t+1)=Q(t)+S*dt;
end

% Plotting results
T=[1:169]; C=Q/volume;
plot(T,C,T,MEC,'-r',T,MTC,'-b')