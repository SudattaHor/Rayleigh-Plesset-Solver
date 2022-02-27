function drdt = m_buckling_rp(t, r, app_press, params)
    % Evaluates the Rayleigh-Plesset equation with shell
    % according to eq. 3 in 2005 Marmottant
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
    kappa = params(2);
    c = params(6);
    rho_L = params(3);
    P0 = params(1);
    mu = params(5);
    kappa_s = params(8);
    R0 = params(15);
    % COMPUTE SURFACE TENSION
    sigmaR0 = f_sigma(R0, params);
    sigmaR = f_sigma(R, params);
    % TERMS for f_2
    b1 = P0 + (2 * sigmaR0 / R0);
    b2 = (R / R0)^(-3*kappa);
    b3 = 1 - (3 * kappa * Rprime / c);
    a0 = b1 * b2 * b3 / (rho_L * R);
    a1 = -2 * sigmaR / (rho_L * R^2);
    a2 = -4 * mu * Rprime / (rho_L * R^2);
    a3 = -4 * kappa_s * Rprime / (rho_L * R^3);
    a4 = -m_p(t, app_press, params) / (rho_L * R);
    a5 = -3 * Rprime^2 / (2*R);
    % COMPONENTS
    f_1 = Rprime;
    f_2 = a0 + a1 + a2 + a3 + a4 + a5;
    % SOLUTION
    drdt = [f_1; f_2];
end