function pressure = f_p_ac(t, constants)
    % Computes driving acoustical pressure
    % UNPACK
    ac_amp = constants(15);
    ac_freq = constants(16);
    ac_shift = constants(17);
    app_press = constants(19);
    % COMPUTE
    switch app_press
        case 'sine'
            pressure = ac_amp * sin(2 * pi * ac_freq * (t - ac_shift));
        otherwise
            pressure = 0;
    end
end

