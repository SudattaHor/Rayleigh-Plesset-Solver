function pressure = f_p_inf(t, constants)
    % Evaluates the pressure of the liquid at infinity
    % INPUTS: t - current time
    % OUTPUTS: pressure at infinity
    % UNPACK
    p_inf0 = constants(8);
    A = constants(9);
    t_w = constants(10);
    phi = constants(11);
    % EVALUATE
    pressure = p_inf0 * (1 - A*exp(-((t-phi)/t_w)^2));
end