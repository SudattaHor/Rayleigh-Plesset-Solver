function drdt = m_gen_rp(t, r,app_press,params)
    % Evaluates the Rayleigh-Plesset equation without shell
    % according to eq. 2.10 in Brennen
    % INPUTS:
    %   t - the current time
    %   r - a two-dimensional vector [r; r'] representing
    %       r, the radius, and r', the radius velocity
    % OUTPUTS:
    %   drdt - a two-dimensional vector [f_1; f_2] where
    %          f_1 = r' and f_2 = r''
    
    % UNPACK
    rho_L = params(3);
    nu_L = params(4);
    S = params(7);
    R = r(1);
    Rprime = r(2);
    p_B = f_p_B(r, params);
    p_inf = m_p(t,app_press,params);
    % TERMS for f_2
    a_0 = (p_B - p_inf) / (R * rho_L);
    a_1 = -(3 * Rprime^2) / (2 * R);
    a_2 = -(4 * nu_L * Rprime) / R^2;
    a_3 = -(2 * S) / (rho_L * R^2);
    % COMPONENTS
    f_1 = Rprime;
    f_2 = a_0 + a_1 + a_2 + a_3;
    % SOLUTION
    drdt = [f_1; f_2];
end