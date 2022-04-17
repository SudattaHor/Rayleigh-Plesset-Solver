function pressure = f_pressure(t, params)
    % Calculates the applied pressure to the bubble

    addpath(strcat(pwd, '/data'));
    % UNPACK
    P0 = params.P0;
    % EVALUATE
    switch params.app_press
        case '1atm'
            pressure = P0;
        case '2atm'
            pressure = 2*P0;
        case '10atm'
            pressure = 10*P0;
        case '100atm'
            pressure = 100*P0;
        case '0.5atm'
            pressure = 0.5*P0;
        case '0.1atm'
            pressure = 0.1*P0;
        case 'from-data'
            load('press-from-data.mat', 'press_form');
            pressure = ppval(press_form, t);
        otherwise
            pressure = P0 + f_p_ac(t, app_press, params);
    end
end

function pressure = f_p_ac(t, app_press, params)
    % Computes driving acoustical pressure
    
    % UNPACK
    ac_amp = params.ac_amp;
    ac_freq = params.ac_freq;
    ac_shift = params.ac_shift;
    delay = params.delay;
    % COMPUTE
    if t < delay
        pressure = 0;
        return
    end
    switch app_press
        case 'sine'
            pressure = ac_amp * sin(2 * pi * ac_freq * (t - ac_shift));
        otherwise
            pressure = 0;
    end
end

