clear;
addpath(strcat(pwd,'/src'));

% CONSTANTS


% INPUT VALUES
R0 = [2.4E-03; 0];  % initial condition
t_f = 1.5E-4;            % final time

% VECTOR FOR CONSTANTS


% COMPUTATION
tspan = [0, t_f];   
[t,y] = ode45(@(t,r) m_buckling_rp(t,r,constants),tspan,R0);

% PLOT
plot(t/t_c,y(:,1), 'Color', 'Blue')
title('')
ylabel('R','Interpreter','latex')
xlabel('Time','Interpreter','latex')