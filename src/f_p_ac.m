function pressure = f_p_ac(t, constants)
    % Calculates P_ac(t)
    % UNPACK
    P0 = constants(4);
    % EVALUATE
    pressure = 10*P0 + t*0;
end

