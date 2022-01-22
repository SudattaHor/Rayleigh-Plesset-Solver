% FUNCTIONS
addpath(strcat(pwd,'/src'));

% CONSTANTS
global rho_L nu_L S p_B0 p_G R0 p_inf0 A t_f;
rho_L = 1000;  % liquid density
nu_L = 1.0E-06;   % liquid kinematic viscosity
S = 72e-03;      % surface tension of bubble
p_B0 = 1;
p_G = 1;
p_inf0 = 1;
A = 1;


% INPUT VALUES
R0 = [2.4E-06; 1.0E-07]; % initial condition
t_f = 9E-07;   
% t_frames = 100;
% tr = linspace(0, t_f, 100);

% COMPUTATION
tspan = [0, t_f];   
[t,y] = ode45(@f_gen_rp,tspan,R0);

% PLOT
plot(t,y(:,1)/R0(1))
title('Solution for $p_\infty = \sin(2\pi t)$','Interpreter','latex')
ylabel('$R/R_0$','Interpreter','latex')
xlabel('Time (sec)','Interpreter','latex')