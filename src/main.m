% INPUT VALUES
R0 = [2.4E-06; 1.0E-07]; % initial condition

% DIMENSIONAL VALUES
t_f = 2E-06;   %
t_frames = 100;
tr = linspace(0, t_f, 100);
global rho_L nu_L S;
rho_L = 1000;  % liquid density
nu_L = 1.0E-06;   % liquid kinematic viscosity
S = 72e-03;      % surface tension of bubble

% COMPUTATION
tspan = [0, t_f];
[t,y] = ode45(@gen_rp,tspan, R0);

% PLOT
plot(t,y(:,1),'-',t,y(:,2),'-');
    
% GENERAL RAYLEIGH-PLESSET
function drdt = gen_rp(t, r)
    % Evaluates the general Rayleigh-Plesset equation
    % INPUTS:
    %   t - the current time
    %   r - a two-dimensional vector [r; r'] representing
    %       r, the radius, and r', the radius velocity
    % OUTPUTS:
    %   drdt - a two-dimensional vector [f_1; f_2] where
    %          f_1 = r' and f_2 = r''
    global rho_L nu_L S;
    a_0 = (p_B(t) - p_inf(t)) / (r(1) * rho_L);
    a_1 = (3 * r(2)^2) / (2 * r(1));
    a_2 = (4 * nu_L * r(2)) / r(1)^2;
    a_3 = (2 * S) / (rho_L * r(1)^2);
    f_1 = r(2);
    f_2 = a_0 + a_1 + a_2 + a_3;
    drdt = [f_1; f_2];
end

% PRESSURE INSIDE BUBBLE
function pressure = p_B(t)
    % Evaluates the pressure inside bubble
    % INPUTS:
    % OUTPUTS:
    pressure = sin(2*pi*t);    
end

% PRESSURE AT INFINITY
function pressure = p_inf(t)
    % Evaluates the pressure of the liquid at infinity
    % INPUTS:
    % OUTPUTS:
    pressure = sin(2*pi*t);
end