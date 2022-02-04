function p_G0 = f_p_G0(constants)
    % Evaluates the intial partial pressure of gas, assuming equilibrium
    S = constants(3);
    R_0 = constants(6);
    p_vTb = constants(4);
    p_inf0 = constants(8);
    p_G0 = ((2*S)/R_0) + p_inf0 - p_vTb;
end

