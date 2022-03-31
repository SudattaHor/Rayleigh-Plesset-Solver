clear; close all; clc;
addpath(strcat(pwd, '/src'));
addpath(strcat(pwd, '/data'));
 
global ruptured buckled;
ruptured = false;
buckled = false;

% INPUT VALUES
R0 = [0.975e-6; 0];
tspan = [0, 2e-6];
tolerance = 1e-8;
dimensionless = false;
shell_on = true;
acoustic_correction_on = true;
app_press = 'from-data';

options = odeset('RelTol',tolerance);

% CASE 1
param1 = f_call_parameters(R0, shell_on, acoustic_correction_on, app_press);
[t1,y1] = ode113(@(t,r) m_rayleigh_plesset(t,r,param1),tspan,R0, options);

% CASE 2
% param2 = f_call_parameters(R0, false, false, app_press);
% [t2, y2] = ode45(@(t,r) m_rayleigh_plesset(t,r,param2),tspan,R0);

% MARMOTTANT    
data = readmatrix("data\data-fig5-marmottant.csv");
t3 = data(:, 1);
y3 = data(:, 2);

% SURFACE TENSION
ruptured = false;
buckled = false;
st1 = arrayfun(@(x) f_sigma(x, param1), y1(:,1));
st3 = arrayfun(@(x) f_sigma(x, param1), y3);

% PLOT
tiledlayout(2,1)
nexttile
f_plot(t1, y1(:,1), param1, dimensionless, '-', 'Replica')
% f_plot(t2, y2, param2, dimensionless, '--', 'Unmodified Rayleigh Plesset without Shell')
f_plot(t3, y3, param1, dimensionless, '-.', 'Original')
yline(param1.R_buckling, 'LineStyle', '-.', 'DisplayName', '$R_{buckling}$')
ylabel("Radius")
legend('Interpreter','latex')
% f_label(dimensionless, app_press)
nexttile
f_plot(t1, st1, param1, dimensionless, '-', 'Replica')
f_plot(t3, st3, param1, dimensionless, '-.', 'Original')
xlabel("Time")
ylabel("Surface Tension")
legend('Interpreter','latex')