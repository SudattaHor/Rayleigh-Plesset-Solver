function pressure = f_p_inf(t)
    % Evaluates the pressure of the liquid at infinity
    % INPUTS: t - current time
    % OUTPUTS: pressure at infinity
    global p_inf0 A t_f;
    pressure = p_inf0 * (1 - A*exp(-(t/t_f)^2));
end