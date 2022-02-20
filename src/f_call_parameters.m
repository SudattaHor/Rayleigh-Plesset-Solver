function params = f_call_parameters(R0, Stoggle)
    % VALUES
    kappa = 1.4;            % ratio of specific heats - adiabatic
    c = 1.48e3;             % speed of sound in water
    rho_L = 1e3;            % liquid density
    P0 = 1.01e5;            % ambient pressure / atmospheric pressure
    mu = 1e-1;              % surrounding liquid viscosity
    kappa_s = 1.5e-10;      % shell viscosity
    kai = 2e-1;             % elastic modulus
    S_water = 7.3e-2;       % water surface tension
    S_break_up = 1.3e-1;    % break-up tension
    R_buckling = R0(1);     % radius for buckling
    ac_shift = 0.15e-6;     % phase shift for pressure deviation
    ac_freq = 2.9e6;        % freq for pressure deviation
    ac_amp = 1.3e5;         % amplitude for pressure deviation

    % VECTOR
    params = [];
    params(1) = kappa;
    params(2) = c;
    params(3) = rho_L;
    params(4) = P0;
    params(5) = mu;
    params(6) = kappa_s;
    params(7) = R_buckling;
    params(10) = kai;
    params(11) = S_water;
    params(12) = R0(1);
    params(13) = R0(2);
    params(14) = S_break_up;
    params(8) = f_Rbreak_up(params);
    params(9) = f_Rruptured(params);
    params(15) = ac_amp;
    params(16) = ac_freq;
    params(17) = ac_shift;
    params(18) = Stoggle;
end

