%{
    Run this file to interpolate radius data from .csv file and calculate
    the applied pressure needed to recreate the curve
%}
clear; close all; clc;
addpath(strcat(pwd, '/data'));
addpath(strcat(pwd, '/src'));

% INPUT VALUES
R0 = [0.975e-6; 0];
shell_on = true;
acoustic_correction_on = true;
app_press = 'from-data';
% CALL PARAM
param1 = f_call_parameters(R0, shell_on, acoustic_correction_on, app_press);
% CALL MAKE_PRESS
dataname = "data-fig5-marmottant.csv";
make_press(param1, dataname, true);

function make_press(params, dataname, show)
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
    p = p_ac(t, ppradius, ppradiusp, ppradiuspp, params);
    if show
        % PLOT P_ac
        plot(t, p/p(1),"DisplayName","Pressure");
        hold on;
        plot(t, r/r(1),"DisplayName","Radius")
        xlabel("Time ($\mu s$)", "Interpreter","latex")
        ylabel("$\frac{y}{y_0}$", "Interpreter","latex", 'Rotation',0)
        legend()
    end
    % CREATE PPFORM OF p
    press_form = interp1(t, p, 'spline', 'pp');
    % SAVE TO .MAT
    clearvars -except press_form;
    save("data/press-from-data.mat");
end

function pressure = p_ac(t, ppradius, ppradiusp, ppradiuspp, params)
    % Computes driving acoustical pressure given expressions for R, R' and R''
    % in a piecewise polynomial

    % UNPACK
    P0 = params.P0;
    kappa = params.kappa;
    c = params.c;
    rho_L = params.rho_L;
    p_vTb = params.p_vTb;
    mu = params.mu_L;
    kappa_s = params.kappa_s;
    R0 = params.R0;
    shell_on = params.shell_on;
    acoustic_correction_on = params.acoustic_correction_on;
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
    p_G0 = (2*sigmaR0/R0) + P0;
    a0 = correction .* (p_G0 .* (R0./R).^(3*kappa));
    a1 = -2 * sigmaR ./ R;
    a2 = -4 * mu * Rp ./ R;
    a4 = -rho_L * (R.*Rpp + 3 .* Rp.^2 ./ 2);
    pressure = a0 + a1 + a2 + a3 + a4;
end
