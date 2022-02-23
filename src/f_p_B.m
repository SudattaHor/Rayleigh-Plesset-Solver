<<<<<<< HEAD
function pressure = f_p_B(R, constants)
=======
function pressure = f_p_B(R, params)
>>>>>>> 788829547e9614b3c4197972177dfb7c49dca8f8
    % Evaluates the pressure inside bubble
    % INPUTS: R - current radius of bubble
    % OUTPUTS: pressure inside the bubble
    % UNPACK
<<<<<<< HEAD
    p_vTb = constants(4);
    p_G0 = constants(5);
    R0 = constants(6);
    R = R(1);
    k = constants(12);
    % EVALUATE
    pressure = p_vTb + p_G0 * (R0/R)^(3*k);    
=======
    p_vTb = params(10);
    p_G0 = f_p_G0(params);
    R0 = params(13);
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
>>>>>>> 788829547e9614b3c4197972177dfb7c49dca8f8
end