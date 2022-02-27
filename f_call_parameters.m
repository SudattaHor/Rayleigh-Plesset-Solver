function params = f_call_parameters(R, Stoggle, app_press)
    % Returns a vector containing all parameters
    % INPUTS:
    %   R - the intial radius vector [R0; R0prime]
    %   Stoggle - true to use constant surface tension
    %             false to use piecewise surface tension according
    %               to eq. 4 in 2005 Marmottant

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
    S_break_up = 2;         % break-up tension
    R_buckling = R0;        % radius for buckling
    R_break_up = R_turn(R_buckling, S_break_up, kai);
    R_ruptured = R_turn(R_buckling, S_water, kai);
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
    params(13) = R_break_up;
    params(14) = R_ruptured;
    params(15) = R0;
    params(16) = R0prime;
    params(17) = ac_shift;
    params(18) = ac_freq;
    params(19) = ac_amp;
    params(20) = Stoggle;
    params(21) = cav_time(R0, rho_L, app_press, params);
end

function ret = R_turn(R_buckling, S, kai)
    % Computes turning points of R, i.e. R_break_up and R_ruptured
    ret = R_buckling * sqrt(1 + S / kai);
end

function ret = cav_time(R0, rho_L, app_press, params)
    % Computes time of cavitation
    if ~strcmp(app_press(end-2:end), 'atm')
        ret = 1;
        return
    end
    ret = 0.915 * R0 * sqrt(rho_L/m_p(0, app_press, params));
end