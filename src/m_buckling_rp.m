function drdt = m_buckling_rp(t, r, constants)
    % Evaluates the Rayleigh-Plesset equation
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
    % TERMS for f_2
    b1 = P0 + (2 * f_sigma(R0, constants) / R0);
    b2 = (R / R0)^(-3*kappa);
    b3 = 1 - (3 * kappa * Rprime / c);
    a0 = b1 * b2 * b3 / (rho_L * R);
    a1 = -P0 / (rho_L * R);
    a2 = -2 * f_sigma(R, constants) / (rho_L * R^2);
    a3 = -4 * mu * Rprime / (rho_L * R^2);
    a4 = -4 * kappa_s * Rprime / (rho_L * R^3);
    a5 = -P_ac(t);
    % COMPONENTS
    f_1 = Rprime;
    f_2 = a0 + a1 + a2 + a3 + a4 + a5;
    % SOLUTION
    drdt = [f_1; f_2];
end