function S = f_sigma(R, constants)
    % solves for sigma(r)
    % output is [surface tension, ruptured]
    % UNPACK
    global ruptured;
    R_buckling = constants(7);
    R_break_up = constants(8);
    R_ruptured = constants(9);
    kai = constants(10);
    S_water = constants(11);
    % EVALUATE
    if ruptured
        S = S_water;
    else
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
end

