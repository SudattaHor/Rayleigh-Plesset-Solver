function R_break_up = f_Rbreak_up(params)
    % computes R_break_up
    % UNPACK
    R_buckling = params(12);
    S_break_up = params(11);
    kai = params(9);
    % COMPUTE
    R_break_up = R_buckling * sqrt(1 + S_break_up / kai);
end

