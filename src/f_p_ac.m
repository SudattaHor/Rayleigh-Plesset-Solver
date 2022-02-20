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

