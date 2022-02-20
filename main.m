clear; close all; clc;
addpath(strcat(pwd, '/src'));
 
% RUPTURED
global ruptured;
ruptured = false;       % true if shell has ruptured

% INPUT VALUES
R0 = [2.4e-3; 0];
t_f = 1e-3;
app_press = '1atm';
buckling = false;

% SET UP FIGURE
figure(1)

% CASE FOR PIECEWISE SURFACE TENSION
tspan = [0, t_f];
param1 = f_call_parameters(R0, false);
if buckling
    [t,y1] = ode45(@(t,r) m_buckling_rp(t,r,app_press,param1),tspan,R0); 
else
    [t, y1] = ode45(@(t,r) m_gen_rp(t,r,app_press,param1),tspan,R0);
end
% PLOT
plot(t,y1(:,1), 'Color', 'Blue')
hold on;

% % CASE FOR CONSTANT SURFACE TENSION
% tspan = [0, t_f];
% param2 = f_call_parameters(R0, true);
% if buckling
%     [t,y2] = ode45(@(t,r) m_buckling_rp(t,r,app_press,param2),tspan,R0);
% else
%     [t, y2] = ode45(@(t,r) m_gen_rp(t,r,app_press,param2),tspan,R0);
% end
% % PLOT
% plot(t,y2(:,1), 'Color', 'Red')

title(strcat('Applied Pressure: ', app_press))
ylabel('R (m)','Interpreter','latex')
xlabel('Time (s)','Interpreter','latex')
% legend('Piecewise Surface Tension', 'Constant Surface Tension')
hold off;

%#ok<*UNRCH>