function res = Hd(tmp)
    N = size(tmp);
    res = zeros(N);
    res((0 <= tmp) && (tmp < 0.5)) = 1i * 2 * pi * tmp;
    res((0.5 <= tmp) && (tmp <= 1)) = 1i * 2 * pi * (tmp - 1);
end
