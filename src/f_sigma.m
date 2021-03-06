function S = f_sigma(R, params)
    % Calculates sigma(r)

    % UNPACK
    global ruptured;
    R_buckling = params.R_buckling;
    R_break_up = params.R_break_up;
    R_ruptured = params.R_ruptured;
    kai = params.kai;
    S_water = params.S_water;
    shell_on = params.shell_on;
    % TOGGLE SHELL OFF
    if ~shell_on
        S = S_water;
        return
    end
    % RUPTURED
    if ruptured && (R >= R_ruptured)
        S = S_water;
        return
    end
    % PIECEWISE
    if (R <= R_buckling)
        S = 0;
    elseif (R <= R_break_up)
        S = kai * ((R/R_buckling)^2 - 1);
    else
        S = S_water;
        ruptured = true;
    end
end

