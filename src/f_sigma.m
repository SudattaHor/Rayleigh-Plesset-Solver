function S = f_sigma(R, params)
    % solves for sigma(r)
    % output is [surface tension, ruptured]
    % UNPACK
    global ruptured;
    R_buckling = params(12);
    R_break_up = f_Rbreak_up(params);
    R_ruptured = f_Rruptured(params);
    kai = params(9);
    S_water = params(7);
    Stoggle = params(18);
    % TOGGLE CONSTANT SURFACE TENSION
    if Stoggle
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
        S = kai * ((R/R_buckling)^2 - 1);
    elseif (R <= R_ruptured)
        S = kai * ((R/R_break_up)^2 - 1);
    else
        S = S_water;
        ruptured = true;
    end
end

