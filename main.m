clear; close all; clc;
addpath(strcat(pwd, '/src'));
 
% RUPTURED
global ruptured;
ruptured = false;       % true if shell has ruptured

% INPUT VALUES
R0 = [0.975e-3; 0];
t_f = 2.1e-3;
app_press = '1atm';

% SET UP FIGURE
figure(1)

% CASE FOR SHELL
tspan = [0, t_f];
param1 = f_call_parameters(R0, true, app_press);
[t,y1] = ode45(@(t,r) m_buckling_rp(t,r,app_press,param1),tspan,R0); 
% PLOT
plot(t,y1(:,1))
hold on

% CASE FOR NO SHELL
tspan = [0, t_f];
param2 = f_call_parameters(R0, true, app_press);
[t, y2] = ode45(@(t,r) m_gen_rp(t,r,app_press,param2),tspan,R0);
% PLOT
plot(t,y2(:,1))
hold on

title(strcat('Applied Pressure: ', app_press))
ylabel('R (m)','Interpreter','latex')
xlabel('Time (s)','Interpreter','latex')
legend('With Shell', 'Without Shell')
hold off
