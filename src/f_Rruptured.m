function R_ruptured = f_Rruptured(params)
    % computes R_ruptured
    % UNPACK
    R_buckling = params(12);
    S_water = params(7);
    kai = params(9);
    % COMPUTE
    R_ruptured = R_buckling * sqrt(1 + S_water / kai);
end

