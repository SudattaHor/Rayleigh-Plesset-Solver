clear; close all; clc;
addpath(strcat(pwd, '/src'));
 
% RUPTURED
global ruptured;
ruptured = false;

% INPUT VALUES
R0 = [2.4e-6; 0];
t_f = 1e-6;
dimensionless = true;
shell_on = true;
acoustic_correction_on = true;
app_press = '10atm';

% CASE 1
tspan = [0, t_f];
param1 = f_call_parameters(R0, shell_on, acoustic_correction_on, app_press);
[t,y1] = ode45(@(t,r) m_rayleigh_plesset(t,r,app_press,param1),tspan,R0); 
f_plot(t, y1, param1, dimensionless, '-', 'Modified Rayleigh Plesset with Shell')

% CASE 2
tspan = [0, t_f];
param2 = f_call_parameters(R0, false, false, app_press);
[t, y2] = ode45(@(t,r) m_rayleigh_plesset(t,r,app_press,param2),tspan,R0);
f_plot(t, y2, param2, dimensionless, '--', 'Unmodified Rayleigh Plesset without Shell')

% BUCKLING RADIUS
yline(param2(12)/R0(1), 'LineStyle', '-.', 'DisplayName', '$R_{buckling}$')

% LABEL FIGURE
f_label(dimensionless, app_press)