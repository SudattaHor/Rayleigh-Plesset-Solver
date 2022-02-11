clear;
addpath(strcat(pwd,'/src'));

% CONSTANTS
kappa = 1.4;    % constant for gas
c = 1;
rho_L = 1e3;    % liquid density
P0 = 1;
mu = 1; % surrounding current viscosity
kappa_s = 1;
p_atm = 1e5;    % atmospheric pressure
R_buckling = 1;
R_break_up = 1;
kai = 1;
S_water = 1;

% INPUT VALUES
R0 = [2.4E-03; 0];
t_f = 1.5E-4;

% VECTOR FOR CONSTANTS
constants = [];
constants(1) = kappa;
constants(2) = c;
constants(3) = rho_L;
constants(4) = P0;
constants(5) = mu;
constants(6) = kappa_s;
constants(7) = p_atm;
constants(8) = R_buckling;
constants(9) = R_break_up;
constants(10) = kai;
constants(11) = S_water;
constants(12) = R0(1);
constants(13) = R0(2);

% COMPUTATION
tspan = [0, t_f];   
[t,y] = ode45(@(t,r) m_buckling_rp(t,r,constants),tspan,R0);

% PLOT
plot(t,y(:,1), 'Color', 'Blue')
title('')
ylabel('R','Interpreter','latex')
xlabel('Time','Interpreter','latex')