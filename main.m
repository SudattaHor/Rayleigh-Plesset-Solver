clear; close all; clc;
addpath(strcat(pwd, '/src'));
 
% RUPTURED
global ruptured;
ruptured = false;       % true if shell has ruptured

% INPUT VALUES
R0 = [0.975e-6; 0];
t_f = 2.1e-6;
app_press = 'sine';

% SET UP FIGURE
figure(1)

% CASE FOR BUCKLING
tspan = [0, t_f];
param1 = f_call_parameters(R0, true);
[t,y1] = ode45(@(t,r) m_buckling_rp(t,r,app_press,param1),tspan,R0); 
% PLOT
plot(t,y1(:,1), 'Color', 'Blue')
hold on;

% CASE FOR GENERAL
tspan = [0, t_f];
param2 = f_call_parameters(R0, true);
[t, y2] = ode45(@(t,r) m_gen_rp(t,r,app_press,param2),tspan,R0);

% PLOT
plot(t,y2(:,1), 'Color', 'Red')

title(strcat('Applied Pressure: ', app_press))
ylabel('R (m)','Interpreter','latex')
xlabel('Time (s)','Interpreter','latex')
% legend('With Buckling', 'General')
hold off;

%#ok<*UNRCH>