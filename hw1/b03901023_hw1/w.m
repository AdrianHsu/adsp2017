function W = w(value)
    p_b = [1100 / 5000, 2500 / 5000]; % passband
    t_b = [900 / 5000, 1100 / 5000]; % transition band
    s_b = [0, 900 / 5000];
    
    W = zeros(size(value));
    W((0.0 <= s_b(1)) & (value <= t_b(1))) = 0.5;
    W((p_b(1) <= value) & (value <= p_b(2))) = 1.0;
end