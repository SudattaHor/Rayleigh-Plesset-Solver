function pressure = m_p(t, app_press, params)
    % Calculates pressure of liquid
    % UNPACK
    P0 = params(1);
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
            pressure = P0 + f_p_ac(t, app_press, params);
    end
end

function pressure = f_p_ac(t, app_press, params)
    % Computes driving acoustical pressure
    % UNPACK
    ac_amp = params(17);
    ac_freq = params(16);
    ac_shift = params(15);
    % COMPUTE
    switch app_press
        case 'sine'
            pressure = ac_amp * sin(2 * pi * ac_freq * (t - ac_shift));
        otherwise
            pressure = 0;
    end
end