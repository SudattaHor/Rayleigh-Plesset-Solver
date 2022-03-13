clear; close all; clc;
addpath(strcat(pwd, '/src'));
addpath(strcat(pwd, '/data'));
 
% RUPTURED
global ruptured;
ruptured = false;

% INPUT VALUES
R0 = [0.975e-6; 0];
tspan = [0, 2e-6];
tolerance = 1e-3;
dimensionless = false;
shell_on = true;
acoustic_correction_on = true;
app_press = 'from_data';

% CASE 1
param1 = f_call_parameters(R0, shell_on, acoustic_correction_on, app_press);
options = odeset('RelTol',tolerance);
[t,y1] = ode45(@(t,r) m_rayleigh_plesset(t,r,app_press,param1),tspan,R0,options); 
f_plot(t, y1, param1, dimensionless, '-', 'Modified Rayleigh Plesset with Shell')

% CASE 2
param2 = f_call_parameters(R0, false, false, app_press);
[t, y2] = ode45(@(t,r) m_rayleigh_plesset(t,r,app_press,param2),tspan,R0,options);
f_plot(t, y2, param2, dimensionless, '--', 'Unmodified Rayleigh Plesset without Shell')

% MARMOTTANT
data = readmatrix("data\data-fig5-marmottant.csv");
t = data(:, 1);
r = data(:, 2);
f_plot(t, r, param2, dimensionless, '-.', "Simulation Data from Marmottant")

% FIND PRESSURE HIST
% dataname = "data-fig5-marmottant.csv";
% press_hist(param2, dataname);

% BUCKLING RADIUS
% yline(param2(12)/R0(1), 'LineStyle', '-.', 'DisplayName', '$R_{buckling}$')

% LABEL FIGURE
f_label(dimensionless, app_press)