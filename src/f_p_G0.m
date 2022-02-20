function p_G0 = f_p_G0(params)
    % Evaluates the intial partial pressure of gas, assuming equilibrium
    S = params(7);
    R_0 = params(13);
    p_vTb = params(10);
    p_inf0 = params(1);
    p_G0 = ((2*S)/R_0) + p_inf0 - p_vTb;
end

