function drdt = m_buckling_rp(t, r, constants)
    % Evaluates the Rayleigh-Plesset equation
    % INPUTS:
    %   t - the current time
    %   r - a two-dimensional vector [r; r'] representing
    %       r, the radius, and r', the radius velocity
    % OUTPUTS:
    %   drdt - a two-dimensional vector [f_1; f_2] where
    %          f_1 = r' and f_2 = r''
    %
    % TODO - IMPLEMENT
    %
    % SOLUTION
    drdt = [t*0, r*0];
end