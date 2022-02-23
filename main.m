<<<<<<< HEAD
clear;
addpath(strcat(pwd,'/src'));

% CONSTANTS
rho_L = 1000;  % liquid density
nu_L = 1.0E-04;   % liquid kinematic viscosity
S = 7.2E-02;      % surface tension of bubble
p_vTb = 2.3E03;       % vapor pressure in bubble
p_atm = 1.01E5;     % initial pressure at infinity
A = 1.0E3;          % constant for gaussian waveform
k = 1.4;          % constant for polytropic gas
t_w = 1E-5;        % time window

% INPUT VALUES
R0 = [2.4E-03; 0];  % initial condition
t_f = 1.5E-4;            % final time
phi = 0;            % phase shift of gaussian waveform

% VECTOR FOR CONSTANTS
constants = [];
constants(1) = rho_L;
constants(2) = nu_L;
constants(3) = S;
constants(4) = p_vTb;
constants(6) = R0(1);
constants(7) = R0(2);
constants(8) = p_atm;
constants(9) = A;
constants(10) = t_w;
constants(11) = phi;
constants(12) = k;
constants(5) = f_p_G0(constants);

% COMPUTATION
tspan = [0, t_f];   
[t,y] = ode45(@(t,r) m_gen_rp(t,r,constants),tspan,R0);

% PLOT
t_c = 0.915*R0(1) * sqrt(rho_L/(f_p_inf(t, constants)-p_vTb)); % appx. time for cavitation
plot(t/t_c,y(:,1)/R0(1), 'Color', 'Blue')
title('Figure 6')
ylabel('$R/R_0$','Interpreter','latex')
xlabel('Dimensionless Time ($t/t_c$)','Interpreter','latex')
=======
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

% % CASE FOR GENERAL
% tspan = [0, t_f];
% param2 = f_call_parameters(R0, true);
% [t, y2] = ode45(@(t,r) m_gen_rp(t,r,app_press,param2),tspan,R0);
% 
% % PLOT
% plot(t,y2(:,1), 'Color', 'Red')

title(strcat('Applied Pressure: ', app_press))
ylabel('R (m)','Interpreter','latex')
xlabel('Time (s)','Interpreter','latex')
% legend('With Buckling', 'General')
hold off;

%#ok<*UNRCH>
>>>>>>> 788829547e9614b3c4197972177dfb7c49dca8f8
