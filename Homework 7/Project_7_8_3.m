% Project 7.8.3
%
% A. Write a differential equation for the voltage applied to the heart by
% a defibrillator. This equation is piecewise and consists of an equation
% for E'(t) during the time when the capacitor is charging and sending no
% current to the heart and an equation when the capacitor is discharging
% and conveying an electrical impulse to the heart.
%
% ANSWER: 
% E(t) = -RC*dv/dt -> charging
% E(t) = RC*dv/dt  -> discharging
%
% B. Develop a model for a defibrillator circuit. Suppose the defibrillator
% has a 5000V battery and a 32uF capacitor. The resistance of a patient is
% between 50 ohms and 150 ohms. Plot voltage applied to the heart versus
% time as well as other appropriate graphs.

dynsim('circuit1', 0, 50, [1;1], 100, 'RK4', .000001, 0, 1);