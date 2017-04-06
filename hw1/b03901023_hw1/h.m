function H = h(value)

    tmp = 1000 / 5000;
    H = zeros(size(value));
    H((0 <= value) & (value < tmp)) = 0;
    H((tmp <= value) & (value <= 0.5)) = 1;
end