function drdt = m_gen_rp(t, r, constants)
    % Evaluates the general Rayleigh-Plesset equation
    % INPUTS:
    %   t - the current time
    %   r - a two-dimensional vector [r; r'] representing
    %       r, the radius, and r', the radius velocity
    % OUTPUTS:
    %   drdt - a two-dimensional vector [f_1; f_2] where
    %          f_1 = r' and f_2 = r''
    % UNPACK
    rho_L = constants(1);
    nu_L = constants(2);
    S = constants(3);
    p_B = f_p_B(r, constants);
    p_inf = f_p_inf(t, constants);
    % TERMS for f_2
    a_0 = (p_B - p_inf) / (r(1) * rho_L);
    a_1 = (3 * r(2)^2) / (2 * r(1));
    a_2 = (4 * nu_L * r(2)) / r(1)^2;
    a_3 = (2 * S) / (rho_L * r(1)^2);
    % COMPONENTS
    f_1 = r(2);
    f_2 = a_0 - a_1 - a_2 - a_3;
    % SOLUTION
    drdt = [f_1; f_2];
end