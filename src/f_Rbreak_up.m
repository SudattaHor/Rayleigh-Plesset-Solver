function R_break_up = f_Rbreak_up(constants)
    % computes R_break_up
    % UNPACK
    R_buckling = constants(7);
    S_break_up = constants(14);
    kai = constants(10);
    % COMPUTE
    R_break_up = R_buckling * sqrt(1 + S_break_up / kai);
end

