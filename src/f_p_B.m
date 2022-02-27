function pressure = f_p_B(R, params)
    % Evaluates the pressure inside bubble
    % INPUTS: R - current radius of bubble
    % OUTPUTS: pressure inside the bubble
    
    % UNPACK
    p_vTb = params(10);
    p_G0 = f_p_G0(params);
    R0 = params(15);
    R = R(1);
    k = params(2);
    % EVALUATE
    pressure = p_vTb + p_G0 * (R0/R)^(3*k);    
end

function p_G0 = f_p_G0(params)
    % Evaluates the intial partial pressure of gas, assuming equilibrium
    S = params(7);
    R_0 = params(13);
    p_vTb = params(10);
    p_inf0 = params(1);
    p_G0 = ((2*S)/R_0) + p_inf0 - p_vTb;
end