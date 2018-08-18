% Models for Module 8.3 on "Empirical Models"
% File:  EmpiricalModels.m

%%
% Linear Empirical Model
% Figure 8.3.1
xLst = [0.2, 0.4, 0.3, 0.3];
yLst = [0.1, 0.3, 0.3, 0.6];
plot(xLst, yLst, 'o')

% Figure 8.3.2
hold on
lineCoeffs = polyfit(xLst, yLst, 1)
x = 0:0.1:0.6;
lineValues = polyval(lineCoeffs, x);
plot(x, lineValues);
hold off

% Predictions
x = 0.34;
polyval(lineCoeffs, x)

%%
% Non-Linear One-Term Model

% Figure 8.3.5
xLst = [1.309, 1.471, 1.490, 1.565, 1.611, 1.680];
yLst = [2.138, 3.421, 3.597, 4.340, 4.882, 5.660];
plot(xLst, yLst, 'o', 'MarkerSize', 12, ...
                   'MarkerFaceColor', 'b')
hold on
lineCoeffs = polyfit(xLst, yLst, 1)
x = 1.3:0.1:1.7;
lineValues = polyval(lineCoeffs, x);
plot(x, lineValues);
hold off

% Figure 8.3.6
plot(xLst.^2, yLst, 'o', 'MarkerSize', 12, ...
                   'MarkerFaceColor', 'k')
% Figure 8.3.7
plot(xLst.^3, yLst, 'o', 'MarkerSize', 12, ...
                   'MarkerFaceColor', 'k')
% Figure 8.3.8
plot(xLst.^4, yLst, 'o', 'MarkerSize', 12, ...
                   'MarkerFaceColor', 'k')
% Figure 8.3.9
plot(xLst.^3.5, yLst, 'o', 'MarkerSize', 12, ...
                   'MarkerFaceColor', 'k')
% Figure 8.3.10
hold on
lineCoeffs = polyfit(xLst.^3.5, yLst, 1)
x = 1:8;
lineValues = polyval(lineCoeffs, x);
plot(x, lineValues);
hold off

% Figure 8.3.11
plot(xLst, yLst, 'o', 'MarkerSize', 12, ...
                   'MarkerFaceColor', 'b')
hold on
x = 'x';
f = @(x) lineCoeffs(1) .* x.^3.5 + lineCoeffs(2)
x = 1.3:0.01:1.8;
plot(x, f(x))
hold off

%%
% Solving for y in a One-Term Model
xLst = [77.6, 114.9, 141.1, 190.8, 239.9, 289.0, 332.8, ...
    378.4, 434.8, 477.3, 536.8, 593.1, 689.1, 760.0];
yLst = [10.07, 14.73, 17.94, 23.93, 29.61, 35.18, 40.02, ...
    44.82, 50.76, 55.05, 61.01, 66.40, 75.47, 81.78];

% Figure 8.3.13
plot(xLst, yLst, 'o', 'MarkerSize', 12, ...
                   'MarkerFaceColor', 'b')
% Figure 8.3.14
plot(xLst, yLst.^(6/5), 'o', 'MarkerSize', 12, ...
                   'MarkerFaceColor', 'b')
% The following command returns 0.2679   -5.4863 
lineCoeffs = polyfit(xLst, yLst.^(6/5), 1)

% Figure 8.3.15
p1 = plot(xLst, yLst, 'o', 'MarkerSize', 12, ...
                   'MarkerFaceColor', 'b');
hold on
x = 'x';
f = @(x) (lineCoeffs(1) .* x + lineCoeffs(2)).^(5/6)
x = 0:5:800;
p2 = plot(x, f(x));
hold off
% Alternative for plot of fitted curve
values = polyval(lineCoeffs, x).^(5/6);
plot(x, values);
hold off

%%
% Multi-term Models
xLst = [-6.860120914, -4.324130045, -4.358625055, -4.358426747, -6.955852379, -6.661145254, -6.355462942, -6.118102026, -7.115148017, -6.815308569, -6.519993057, -6.204119983, -5.853871964, -6.109523091, -5.79832982, -5.482672118, -5.171791386, -4.851705903, -4.517126416, -4.143573228, -3.709075441, -3.499489089, -6.300769497, -5.953504836, -5.642065153, -5.031376979, -4.680685696, -4.329846955, -3.928486195, -8.56735134, -8.363211311, -8.107682739, -7.823908741, -7.522878745, -7.218819279, -6.920818754, -6.628932138, -6.323946875, -5.991399828, -8.781464495, -8.663140179, -8.473531488, -8.247337057, -7.971428747, -7.676129393, -7.352812702, -7.072065318, -6.774174009, -6.478861916, -6.159517513, -6.835647144, -6.53165267, -6.224098421, -5.910094889, -5.598599459, -5.290645224, -4.974284616, -4.64454848, -4.290560426, -3.885055584, -3.408378962, -3.13200249, -8.726767166, -8.66695597, -8.511026475, -8.165388579, -7.886056648, -7.588043762, -7.283412422, -6.995678626, -6.691862621, -6.392544977, -6.067374056, -6.684029655, -6.378719832, -6.065855188, -5.752272167, -5.132414673, -4.811352704, -4.098269308, -3.66174277, -3.2644011];
yLst = [0.8116, 0.9072, 0.9052, 0.9039, 0.8053, 0.8377, 0.8667, 0.8809, 0.7975, 0.8162, 0.8515, 0.8766, 0.8885, 0.8859, 0.8959, 0.8913, 0.8959, 0.8971, 0.9021, 0.909 , 0.9139, 0.9199, 0.8692, 0.8872, 0.89  , 0.891 , 0.8977, 0.9035, 0.9078, 0.7675, 0.7705, 0.7713, 0.7736, 0.7775, 0.7841, 0.7971, 0.8329, 0.8641, 0.8804, 0.7668, 0.7633, 0.7678, 0.7697, 0.77  , 0.7749, 0.7796, 0.7897, 0.8131, 0.8498, 0.8741, 0.8061, 0.846 , 0.8751, 0.8856, 0.8919, 0.8934, 0.894 , 0.8957, 0.9047, 0.9129, 0.9209, 0.9219, 0.7739, 0.7681, 0.7665, 0.7703, 0.7702, 0.7761, 0.7809, 0.7961, 0.8253, 0.8602, 0.8809, 0.8301, 0.8664, 0.8834, 0.8898, 0.8964, 0.8963, 0.9074, 0.9119, 0.9228];

% Figure 8.3.16
plot(xLst, yLst, 'o', 'MarkerSize', 12, ...
                   'MarkerFaceColor', 'b');
% Figure 8.3.17
coeffs = polyfit(xLst, yLst, 4)
x = -9:0.1:-3;
values = polyval(coeffs, x);
plot(x, values);
hold on
plot(xLst, yLst, 'o');
hold off

% Figure 8.3.18
coeffs = polyfit(xLst, yLst, 10)
values = polyval(coeffs, x);
plot(x, values);
hold on
plot(xLst, yLst, 'o');
hold off

% Figure 8.3.19
% Coefficients (coeffs) in (x - mu(1))/mu(2)
% where mu(1) = mean and mu(2) = standard deviation
[coeffs, S, mu] = polyfit(xLst, yLst, 10)
x = -2:0.1:2;
values = polyval(coeffs, x);
plot(x, values);
hold on
% adjust original plot
plot((xLst - mu(1)) ./ mu(2), yLst, 'o');
hold off
