function f_label(dimensionless, app_press)
    % Labels the figure
    
    switch dimensionless
        case true
            title(strcat('Applied Pressure: ', app_press))
            ylabel('$R / R_0$','Interpreter','latex')
            xlabel('$t / t_c$','Interpreter','latex')
            legend('With Shell', 'Without Shell')
            hold off
        case false
            title(strcat('Applied Pressure: ', app_press))
            ylabel('R (m)','Interpreter','latex')
            xlabel('Time (s)','Interpreter','latex')
            legend('With Shell', 'Without Shell')
            hold off
    end
end

