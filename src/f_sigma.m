function S = f_sigma(R, constants)
    % solves for sigma(r)
    % UNPACK
    R_buckling = constants(8);
    R_break_up = constants(9);
    kai = constants(10);
    S_water = constants(11);
    % EVALUATE
    if (R <= R_buckling)
        S = 0;
    elseif (R < R_break_up)
        S = kai * ((R/R_buckling)^2 - 1);
    else
        S = S_water;
    end
end

