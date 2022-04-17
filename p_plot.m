clear; close all; clc;
addpath(strcat(pwd, '/src'));
addpath(strcat(pwd, '/data'));
addpath(strcat(pwd, '/output'));

% INPUT
dimensionless = false;

% READ DATA
load param1.mat param1
st1 = readmatrix('st1.csv');
M1 = readmatrix('case1.csv');
t1 = M1(:, 1);
y1(:, 1) = M1(:, 2);
y1(:, 2) = M1(:, 3);
% MARMOTTANT    
data = readmatrix("data\data-fig5-marmottant.csv");
t3 = data(:, 1);
y3 = data(:, 2);

% PLOT
tiledlayout(2,1)
nexttile
f_plot(t1, y1(:,1), param1, dimensionless, '-', 'Replica', 'none')
% f_plot(t2, y2, param2, dimensionless, '--', 'Unmodified Rayleigh Plesset without Shell')
f_plot(t3, y3, param1, dimensionless, 'none', 'Original', 'square')
yline(param1.R_buckling, 'LineStyle', '-.', 'DisplayName', '$R_{buckling}$')
% yline(param1.R_break_up, 'LineStyle', '-', 'DisplayName', '$R_{break-up}$')
% yline(param1.R_ruptured, 'LineStyle', ':', 'DisplayName', '$R_{ruptured}$')
ylabel("Radius")
legend('Interpreter','latex')
% f_label(dimensionless, app_press)
nexttile
f_plot(t1, st1, param1, dimensionless, '-', 'Surface Tesnsion', 'none')
% f_plot(t3, st3, param1, dimensionless, '-.', 'Original')
xlabel("Time")
ylabel("Surface Tension")
legend('Interpreter','latex')

function f_plot(t, y, params, dimensionless, style, dispname, marker)
    % Plots function
    if dimensionless
        R0 = params.R0;
        t_c = cav_time(params);
        t = t / t_c;
        y(:,1) = y(:,1) / R0;
    end
    p = plot(t, y(:,1), "LineStyle", style, "LineWidth", 1, "DisplayName", dispname, 'Marker', marker);
    p.MarkerSize = 5;
    p.MarkerIndices = 1:5:length(t);
    hold on
end

function f_label(dimensionless, app_press)
    % Labels the figure
    
    switch dimensionless
        case true
            title(strcat('Applied Pressure: ', app_press))
            ylabel('$R / R_0$','Interpreter','latex')
            xlabel('$t / t_c$','Interpreter','latex')
            legend('Interpreter','latex')
            hold off
        case false
            title(strcat('Applied Pressure: ', app_press))
            ylabel('R (m)','Interpreter','latex')
            xlabel('Time (s)','Interpreter','latex')
            legend('Interpreter','latex')
            hold off
    end
end

function ret = cav_time(params)
    % Computes time of cavitation
    p_const  = params.p_const;
    R0 = params.R0;
    rho_L = params.rho_L;
    ret = 0.915 * R0 * sqrt(rho_L/p_const);
end