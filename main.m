clear; close all; clc;
addpath(strcat(pwd,'/src'));

% RUPTURED
global ruptured;
ruptured = false;       % true if shell has ruptured

% INPUT VALUES
R0 = [1e-6; 0];
t_f = 9e-6;

% SET UP FIGURE
figure(1)

% CASE FOR PIECEWISE SURFACE TENSION
tspan = [0, t_f];
param1 = f_call_parameters(R0, false);
[t,y1] = ode45(@(t,r) m_buckling_rp(t,r,param1),tspan,R0);
% PLOT
plot(t,y1(:,1), 'Color', 'Blue')
hold on;

% CASE FOR CONSTANT SURFACE TENSION
tspan = [0, t_f];
param2 = f_call_parameters(R0, true);
[t,y2] = ode45(@(t,r) m_buckling_rp(t,r,param2),tspan,R0);
% PLOT
plot(t,y2(:,1), 'Color', 'Red')

title('')
ylabel('R','Interpreter','latex')
xlabel('Time','Interpreter','latex')
legend('Piecewise Surface Tension', 'Constant Surface Tension')
hold off;