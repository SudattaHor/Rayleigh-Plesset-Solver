function drdt = m_rayleigh_plesset(t, r, params)
    % Evaluates the Rayeleigh Plesset equation.
    % INPUTS:
    %   t - the current time
    %   r - a two-dimensional vector [r; r'] representing
    %       r, the radius, and r', the radius velocity
    % OUTPUTS:
    %   drdt - a two-dimensional vector [f_1; f_2] where
    %          f_1 = r' and f_2 = r''

    % UNPACK
    R = r(1);
    Rprime = r(2);
    kappa = params.kappa;
    c = params.c;
    rho_L = params.rho_L;
    P0 = params.P0;
    p_vTb = params.p_vTb;
    mu = params.mu_L;
    kappa_s = params.kappa_s;
    R0 = params.R0;
    shell_on = params.shell_on;
    acoustic_correction_on = params.acoustic_correction_on;
    % COMPUTE SURFACE TENSION
    sigmaR0 = f_sigma(R0, params);
    sigmaR = f_sigma(R, params);
    % TERMS for f_2
    if acoustic_correction_on
        correction = 1 - (3 * kappa * Rprime / c);
    else
        correction = 1;
    end
    if shell_on
        a3 = -4 * kappa_s * Rprime / (rho_L * R^3);
    else
        a3 = 0;
    end
    p_G0 = (2*sigmaR0/R0) + P0;
    a0 = correction * (p_G0 * (R0/R)^(3*kappa)) / (rho_L * R);
    a1 = -2 * sigmaR / (rho_L * R^2);
    a2 = -4 * mu * Rprime / (rho_L * R^2);
    a4 = -f_pressure(t, params) / (rho_L * R);
    a5 = -3 * Rprime^2 / (2*R);
    % COMPONENTS
    f_1 = Rprime;
    f_2 = a0 + a1 + a2 + a3 + a4 + a5;
    % SOLUTION
    drdt = [f_1; f_2];
end