% Develop a model for vancomycin HCL, which is a treatment for serious
% infections by susceptible strains of methicillin-resistant staphylococci
% in penicillin-allergic patients. The drug is administered by IV infusion.
% The intravenous dose is usually 2g divided either as 500mg every 6hr or
% 1g every 12h, and the rate is no more than 10mg/min or over a period of
% at least 50 min, whichever is longer. When kidney function is normal,
% multiple intravenous dosing of 1g results in mean plasma concentrations
% of about 63ug/mL, in 2 hr, and 8 ug/mL, 11 h after infusion. In such
% patients, the mean elimination helf-life from plasma is 4 - 6 hr. The
% mean plasma clearance is approximately .058 L/kg/h 
% (liter of drug per kilogram is about .048 L/kg/h). Thus, include the mass 
% of the patient in the model

dosage = 5e5; % 500mg every 6hr
half_life = 5; % in hours
volume = 3000; % mL in body
Absorption_constant = 0.12;
MEC = 10; % micro-gram/mL
MTC = 20; % micro-gram/mL
t0=0; % Start time 
tf=168; % End time
dt=1; % Change in time
Q(1)=12*1e3; 

% Start simulation by calculating Q(1), Q(2),…,Q(n).
for t=1:dt:168
S1=dilantin(t,Q(t), dosage, half_life); %See function “dilantin” next page
S2=dilantin(t+dt/2,Q(t)+S1*dt/2, dosage, half_life);
S3=dilantin(t+dt/2,Q(t)+S2*dt/2, dosage, half_life);
S4=dilantin(t+dt,Q(t)+S3*dt, dosage, half_life);
S=(S1+2*S2+2*S3+S4)/6;
Q(t+1)=Q(t)+S*dt;
end

% Plotting results
T=[1:169]; C=Q/volume;
plot(T,C,T,MEC,'-r',T,MTC,'-b')