% Project 7.8.5
% Develop a model for the circuit in Figure 7.8.7. Assume L1 = .2 H, L2 =
% 1.0 H, R1 = 10 ohms, R2 = 220 ohms, R3 = 330 ohms, C1 = .1 uF, C2 = 1.0
% uF, E(t) = 117 V, and Q(0) = Q'(0) = 0

dynsim('circuit2', 0, 50, [0;0], 100, 'RK4', .000001, 0, 1);