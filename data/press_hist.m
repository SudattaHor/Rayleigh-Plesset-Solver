clear; close all; clc;
addpath(strcat(pwd, '/src'));
addpath(strcat(pwd, '/data'));
% INPUT VALUES
R0 = [2.4e-3; 0];
shell_on = true;
acoustic_correction_on = true;
app_press = '1atm';
% CALL PARAMETERS
params = f_call_parameters(R0, shell_on, acoustic_correction_on, app_press);
% READ RADIUS HISTORY
data = readmatrix("data-fig5-marmottant.csv");
t = data(:, 1);
r = data(:, 2);
% INTERPOLATE DATA
ppradius = interp1(t, r, 'spline', 'pp');
% FIND R'
ppradiusp = fnder(ppradius, 1);
rp = ppval(ppradiusp, t);
% FIND R''
ppradiuspp = fnder(ppradius, 2);
rpp = ppval(ppradiuspp, t);
% FIND P_ac
p = p_ac(r, rp, rpp, params);
plot(t, p/p(1))
hold on
plot(t, r/r(1))

function pressure = p_ac(R, Rp, Rpp, params)
    % Computes driving acoustical pressure given R, R' and R''

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
    % COMPUTE SURFACE TENSION
    sigmaR0 = f_sigma(R0, params);
    sigmaR = f_sigma(R, params);
    % TERMS for f_2
    if acoustic_correction_on
        correction = 1 - (3 * kappa * Rp / c);
    else
        correction = 1;
    end
    if shell_on
        a3 = -4 * kappa_s * Rp / (R.^2);
    else
        a3 = 0;
    end
    p_G0 = (2.*sigmaR0./R0) + P0 - p_vTb;
    a0 = correction .* (p_vTb + p_G0 * (R0./R).^(3*kappa));
    a1 = -2 .* sigmaR ./ R;
    a2 = -4 .* mu .* Rp ./ R;
    a4 = -rho_L .* (R.*Rpp + 3 .* Rp.^2 ./ 2);
    pressure = a0 + a1 + a2 + a3 + a4 - P0;
end
