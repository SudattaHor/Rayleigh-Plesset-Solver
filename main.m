clear; close all; clc;
addpath(strcat(pwd, '/src'));
 
% RUPTURED
global ruptured;
ruptured = false;       % true if shell has ruptured

% INPUT VALUES
R0 = [0.975e-3; 0];
t_f = 2.1e-4;
app_press = '10atm';
dimensionless = false;

% CASE FOR SHELL
tspan = [0, t_f];
param1 = f_call_parameters(R0, true, app_press);
[t,y1] = ode45(@(t,r) m_buckling_rp(t,r,app_press,param1),tspan,R0); 
% PLOT
f_plot(t, y1, param1, dimensionless, '-')

% CASE FOR NO SHELL
tspan = [0, t_f];
param2 = f_call_parameters(R0, true, app_press);
[t, y2] = ode45(@(t,r) m_gen_rp(t,r,app_press,param2),tspan,R0);
% PLOT
f_plot(t, y2, param2, dimensionless, '--')

% LABEL FIGURE
f_label(dimensionless, app_press)