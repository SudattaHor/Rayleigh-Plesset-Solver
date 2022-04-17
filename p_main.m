clear; close all; clc;
addpath(strcat(pwd, '/src'));
addpath(strcat(pwd, '/data'));
 
global ruptured;
ruptured = false;

% INPUT VALUES
R0 = [0.975e-6; 0];
tspan = [0, 2e-6];
tolerance = 1e-5;
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

% SURFACE TENSION
ruptured = false;
st1 = arrayfun(@(x) f_sigma(x, param1), y1(:,1));
% st3 = arrayfun(@(x) f_sigma(x, param1), y3);

% SAVE DATA
dest_folder = strcat(pwd, '/output/');
save(strcat(dest_folder, 'param1.mat'), 'param1')
writematrix([t1, y1(:,1), y1(:,2)], strcat(dest_folder, 'case1.csv'))
writematrix([st1], strcat(dest_folder, 'st1.csv'))
