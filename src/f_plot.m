function f_plot(t, y, params, dimensionless, style)
    % Plots function

    R0 = params(15);
    t_c = params(21);
    switch dimensionless
        case true
            plot(t / t_c, y(:,1) / R0, "LineStyle", style, "LineWidth", 1)
        case false
            plot(t, y(:,1), "LineStyle", style, "LineWidth", 1)
    end
        hold on
end

