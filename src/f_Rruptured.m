function R_ruptured = f_Rruptured(constants)
    % computes R_ruptured
    % UNPACK
    R_buckling = constants(7);
    S_water = constants(11);
    kai = constants(10);
    % COMPUTE
    R_ruptured = R_buckling * sqrt(1 + S_water / kai);
end

