clear;
addpath(strcat(pwd,'/src'));

% INPUT VALUES
R0 = [2.4E-03; 0];
t_f = 1.5E-4;

% CONSTANTS
kappa = 1.4;            % ratio of specific heats - adiabatic
c = 1.5e3;              % speed of sound in water
rho_L = 1e3;            % liquid density
P0 = 101325;            % ambient pressure / atmospheric pressure
mu = 1;                 % surrounding liquid viscosity
kappa_s = 1.5e-10;      % shell viscosity
kai = 2e-1;             % elastic modulus
S_water = 7.3e-2;       % water surface tension
S_break_up = 1.3e-1;    % break-up tension
R_buckling = R0(1);     % radius for buckling

% VECTOR FOR CONSTANTS
constants = [];
constants(1) = kappa;
constants(2) = c;
constants(3) = rho_L;
constants(4) = P0;
constants(5) = mu;
constants(6) = kappa_s;
constants(7) = R_buckling;
constants(10) = kai;
constants(11) = S_water;
constants(12) = R0(1);
constants(13) = R0(2);
constants(14) = S_break_up;
constants(8) = f_Rbreak_up(constants);
constants(9) = f_Rruptured(constants);

% COMPUTATION
tspan = [0, t_f];   
[t,y] = ode45(@(t,r) m_buckling_rp(t,r,constants),tspan,R0);

% PLOT
plot(t,y(:,1), 'Color', 'Blue')
title('')
ylabel('R','Interpreter','latex')
xlabel('Time','Interpreter','latex')