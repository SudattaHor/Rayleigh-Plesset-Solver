function pressure = f_p_ac(t, constants)
    % Calculates P_ac(t)
    % UNPACK
    p_atm = constants(7);
    % EVALUATE
    pressure = 10*p_atm + t*0;
end

