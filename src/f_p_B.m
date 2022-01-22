function pressure = f_p_B(R)
    % Evaluates the pressure inside bubble
    % INPUTS: R - current radius of bubble
    % OUTPUTS: pressure inside the bubble
    global p_B0 p_G R0;
    pressure = p_B0 + p_G * (R0(1)/R(1))^3;    
end