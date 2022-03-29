function params = f_call_parameters(R, shell_on, acoustic_correction_on, app_press)
    % Returns a vector containing all parameters
    % INPUTS:
    %   R - the intial radius vector [R0; R0prime]
    
    params = struct;
    % CONSTANTS
    params.P0 = 1.01E5;            % atmospheric pressure
    params.kappa = 1.4;            % ratio of specific heats - adiabatic
    % LIQUID
    params.rho_L = 1e3;            % liquid density
    params.nu_L = 1.0e-04;         % liquid kinematic viscosity
    params.mu_L = params.rho_L * params.nu_L;    % liquid dynamic viscosity
    params.c = 1.48e3;             % speed of sound in liquid (water)
    % BUBBLE / SHELL
    params.S_water = 7.3e-02;      % surface tension of bubble
    params.kappa_s = 1.5e-7;      % shell viscosity
    params.kai = 2e-1;             % elastic modulus
    params.p_vTb = 0;         % vapor pressure in bubble
    % INITIAL BUBBLE
    params.R0 = R(1);
    params.R0prime = R(2);
    % BUCKLING / BREAKUP
    params.S_break_up = 1.3e-1;         % break-up tension
    params.R_buckling = 0.95*params.R0;        % radius for buckling
    params.R_break_up = R_turn(params.R_buckling, params.S_break_up, params.kai);
    params.R_ruptured = R_turn(params.R_buckling, params.S_water, params.kai);
    % SINE WAVE
    params.delay = 2e-8;         % time delay for wave to begin
    params.ac_shift = 0;     % phase shift for pressure deviation
    params.ac_freq = 3e6;        % freq for pressure deviation
    params.ac_amp = -7e5;         % amplitude for pressure deviation
    % OTHER
    params.shell_on = shell_on;
    params.acoustic_correction_on = acoustic_correction_on;
    params.app_press = app_press;
    params.p_const = params.P0 * get_p_const(app_press);
end

function ret = R_turn(R_buckling, S, kai)
    % Computes turning points of R, i.e. R_break_up and R_ruptured
    ret = R_buckling * sqrt(1 + S / kai);
end

function pressure = get_p_const(app_press)
    % Extracts value of pressure, if constant. Else, return 1.
    switch app_press
        case '1atm'
            pressure = 1;
        case '2atm'
            pressure = 2;
        case '10atm'
            pressure = 10;
        case '100atm'
            pressure = 100;
        case '0.5atm'
            pressure = 0.5;
        case '0.1atm'
            pressure = 0.1;
        otherwise
            pressure = 1;
    end
end