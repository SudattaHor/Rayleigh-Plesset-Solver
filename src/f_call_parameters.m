function params = f_call_parameters(R, Stoggle)
    % CONSTANTS
    P0 = 1.01E5;            % atmospheric pressure
    kappa = 1.4;            % ratio of specific heats - adiabatic
    % LIQUID
    rho_L = 1e3;            % liquid density
    nu_L = 1.0e-04;         % liquid kinematic viscosity
    mu_L = rho_L * nu_L;    % liquid dynamic viscosity
    c = 1.48e3;             % speed of sound in liquid (water)
    % BUBBLE / SHELL
    S_water = 7.3e-02;      % surface tension of bubble
    kappa_s = 1.5e-10;      % shell viscosity
    kai = 2e-1;             % elastic modulus
    p_vTb = 2.3E03;         % vapor pressure in bubble
    % INITIAL BUBBLE
    R0 = R(1);
    R0prime = R(2);
    % BUCKLING / BREAKUP
    S_break_up = 2;    % break-up tension
    R_buckling = R0;     % radius for buckling
    % SINE WAVE
    ac_shift = 0.16e-6;     % phase shift for pressure deviation
    ac_freq = 2.9e6;        % freq for pressure deviation
    ac_amp = 1.3e5;         % amplitude for pressure deviation

    % VECTOR
    params = [];
    params(1) = P0;
    params(2) = kappa;
    params(3) = rho_L;
    params(4) = nu_L;
    params(5) = mu_L;
    params(6) = c;
    params(7) = S_water;
    params(8) = kappa_s;
    params(9) = kai;
    params(10) = p_vTb;
    params(11) = S_break_up;
    params(12) = R_buckling;
    params(13) = R0;
    params(14) = R0prime;
    params(15) = ac_shift;
    params(16) = ac_freq;
    params(17) = ac_amp;
    params(18) = Stoggle;
end

