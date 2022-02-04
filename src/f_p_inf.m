function pressure = f_p_inf(t, constants)
    % Evaluates the pressure of the liquid at infinity
    % INPUTS: t - current time
    % OUTPUTS: pressure at infinity
    % UNPACK
    p_atm = constants(8);
    A = constants(9);
    t_w = constants(10);
    phi = constants(11);
    % EVALUATE
    % pressure = p_inf0 * (1- A.*exp((phi-t)./t_w).^2);
    pressure = 100*p_atm;
end