function pressure = m_p(t, constants)
    % Calculates pressure of liquid
    % UNPACK
    P0 = constants(4);
    % EVALUATE
    pressure = 0.5* P0 + f_p_ac(t, constants);
end
