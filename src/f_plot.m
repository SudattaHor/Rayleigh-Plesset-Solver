function f_plot(t, y, params, dimensionless, style, dispname)
    % Plots function
    if dimensionless
        R0 = params.R0;
        t_c = cav_time(params);
        t = t / t_c;
        y(:,1) = y(:,1) / R0;
    end
    plot(t, y(:,1), "LineStyle", style, "LineWidth", 1, "DisplayName", dispname)
    hold on
end

function ret = cav_time(params)
    % Computes time of cavitation
    p_const  = params.p_const;
    R0 = params.R0;
    rho_L = params.rho_L;
    ret = 0.915 * R0 * sqrt(rho_L/p_const);
end