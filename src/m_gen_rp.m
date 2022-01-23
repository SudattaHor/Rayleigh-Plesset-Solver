function drdt = m_gen_rp(t, r)
    % Evaluates the general Rayleigh-Plesset equation
    % INPUTS:
    %   t - the current time
    %   r - a two-dimensional vector [r; r'] representing
    %       r, the radius, and r', the radius velocity
    % OUTPUTS:
    %   drdt - a two-dimensional vector [f_1; f_2] where
    %          f_1 = r' and f_2 = r''
    global rho_L nu_L S;
    % TERMS - f_2
    a_0 = (f_p_B(r) - f_p_inf(t)) / (r(1) * rho_L);
    a_1 = (3 * r(2)^2) / (2 * r(1));
    a_2 = (4 * nu_L * r(2)) / r(1)^2;
    a_3 = (2 * S) / (rho_L * r(1)^2);
    % COMPONENTS
    f_1 = r(2);
    f_2 = a_0 + a_1 + a_2 + a_3;
    % SOLUTION
    drdt = [f_1; f_2];
end