function pressure = f_p_B(R, params)
    % Evaluates the pressure inside bubble
    % INPUTS: R - current radius of bubble
    % OUTPUTS: pressure inside the bubble
    % UNPACK
    p_vTb = params(10);
    p_G0 = f_p_G0(params);
    R0 = params(13);
    R = R(1);
    k = params(2);
    % EVALUATE
    pressure = p_vTb + p_G0 * (R0/R)^(3*k);    
end