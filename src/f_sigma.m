function S = f_sigma(R, params)
    % Calculates sigma(r)

    % UNPACK
    global ruptured;
    R_buckling = params(12);
    R_break_up = params(13);
    R_ruptured = params(14);
    kai = params(9);
    S_water = params(7);
    shell_on = params(21);
    % TOGGLE SHELL OFF
    if ~shell_on
        S = S_water;
        return
    end
    % RUPTURED
    if ruptured
        S = S_water;
        return
    end
    % PIECEWISE
    if (R <= R_buckling)
        S = 0;
    elseif (R <= R_break_up)
        S = kai * ((R./R_buckling).^2 - 1);
    elseif (R <= R_ruptured)
        S = kai * ((R./R_break_up).^2 - 1);
    else
        S = S_water;
        ruptured = true;
    end
end

