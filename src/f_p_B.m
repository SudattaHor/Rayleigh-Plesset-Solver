function pressure = f_p_B(R, constants)
    % Evaluates the pressure inside bubble
    % INPUTS: R - current radius of bubble
    % OUTPUTS: pressure inside the bubble
    % UNPACK
    p_B0 = constants(4);
    p_G0 = constants(5);
    R0 = constants(6);
    k = constants(12);
    % EVALUATE
    pressure = p_B0 + p_G0 * (R0/R(1))^(3*k);    
end