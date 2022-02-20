function pressure = m_p(t, app_press, constants)
    % Calculates pressure of liquid
    % UNPACK
    P0 = constants(4);
    % EVALUATE
    switch app_press
        case '1atm'
            pressure = P0;
        case '10atm'
            pressure = 10*P0;
        case '100atm'
            pressure = 100*P0;
        case '0.5atm'
            pressure = 0.5*P0;
        case '0.1atm'
            pressure = 0.1*P0;
        otherwise
            pressure = P0 + f_p_ac(t, app_press, constants);
    end
end

function pressure = f_p_ac(t, app_press, constants)
    % Computes driving acoustical pressure
    % UNPACK
    ac_amp = constants(15);
    ac_freq = constants(16);
    ac_shift = constants(17);
    % COMPUTE
    switch app_press
        case 'sine'
            pressure = ac_amp * sin(2 * pi * ac_freq * (t - ac_shift));
        otherwise
            pressure = 0;
    end
end