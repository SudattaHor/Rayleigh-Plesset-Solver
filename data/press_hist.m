function press_hist(params, dataname)
    % READ RADIUS HISTORY
    data = readmatrix(dataname);
    t = data(:, 1);
    r = data(:, 2);
    % INTERPOLATE DATA
    ppradius = interp1(t, r, 'spline', 'pp');
    % FIND R'
    ppradiusp = fnder(ppradius, 1);
    % FIND R''
    ppradiuspp = fnder(ppradius, 2);
    % PLOT P_ac
    p = p_ac(t, ppradius, ppradiusp, ppradiuspp, params);
    plot(t, p/p(1),"DisplayName" ,"Pressure");
    hold on;
    plot(t, r/r(1),"DisplayName", "Radius")
    xlabel("Time ($\mu s$)", "Interpreter","latex")
    ylabel("$\frac{y}{y_0}$", "Interpreter","latex", 'Rotation',0)
    legend()
    % CREATE PPFORM OF p - TODO
    % SAVE TO .mat FILE - TODO
end

function pressure = p_ac(t, ppradius, ppradiusp, ppradiuspp, params)
    % Computes driving acoustical pressure given expressions for R, R' and R''
    % in a piecewise polynomial

    % UNPACK
    P0 = params(1);
    kappa = params(2);
    c = params(6);
    rho_L = params(3);
    p_vTb = params(10);
    mu = params(5);
    kappa_s = params(8);
    R0 = params(15);
    shell_on = params(21);
    acoustic_correction_on = params(22);
    % COMPUTE R, R', R''
    R = ppval(ppradius, t);
    Rp = ppval(ppradiusp, t);
    Rpp = ppval(ppradiuspp, t);
    % COMPUTE SURFACE TENSION
    sigmaR0 = f_sigma(R0, params);
    sigmaR = f_sigma(R, params);
    % TERMS for f_2
    if acoustic_correction_on
        correction = 1 - (3 * kappa * Rp ./ c);
    else
        correction = 1;
    end
    if shell_on
        a3 = -4 * kappa_s * Rp ./ (R.^2);
    else
        a3 = 0;
    end
    p_G0 = (2.*sigmaR0./R0) + P0 - p_vTb;
    a0 = correction .* (p_vTb + p_G0 * (R0./R).^(3*kappa));
    a1 = -2 * sigmaR ./ R;
    a2 = -4 * mu .* Rp ./ R;
    a4 = -rho_L * (R.*Rpp + 3 .* Rp.^2 ./ 2);
    pressure = a0 + a1 + a2 + a3 + a4 - P0;
end
