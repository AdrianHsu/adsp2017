k = 100;
N = (2 * k) + 1;
res = zeros(N);
for i = 1:N
    res(i) = Hd((i - 1)/N);
end
ff = ifft(res);
for i = 1:N
    sum = i + k + 1;
    tmp = mod((sum), N);
    if sum > N
        imp(i) = ff(mod((sum), N));
    else
        imp(i) = ff(sum);
    end
end
figure;
stem(abs(imp));
title('Impulse Response');

m = (0:0.0005:1);
freq_res = 0;
for i = 1:N
    freq_res = freq_res + imp(i) * exp( -2 * pi * 1i * m * (i - 1));
end

len = 2000;
H = zeros(size(len));

for i = 1:(len + 1)
    half = (i - 1)/len;
    if ((1 <= i) && (i <= (len / 2) + 1))
        H(i) = 2 * pi * 1i * half;
    else
        H(i) = 2 * pi * 1i * (half - 1);
    end
end
figure;
plot(m, abs(freq_res),m , abs(H));
title('Frequency Response');
