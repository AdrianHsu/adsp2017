% B03901023 PIN-CHUN HSU
% Usage
% [X_1 X_2] = fftreal(x1, x2);
function [ Fx, Fy ] = fftreal(x1, x2)
    tmp = x1 + 1i * x2;
    x = fft(tmp);
    
    xr = real(x);
    xi = imag(x);
    N = length(xr);
    x1_r = zeros(N,1);
    x1_i = zeros(N,1);
    x2_r = zeros(N,1);
    x2_i = zeros(N,1);
    x1_r(1) = xr(1);
    x2_r(1) = xi(1);
    x1_r(N / 2+1) = xr(N / 2+1);
    x2_r(N / 2+1) = xi(N / 2+1);
    n0 = 2:(N / 2);
    x1_r(n0) =  0.5 * (xr(n0) + xr(N - n0 + 2));
    x1_i(n0) =  0.5 * (xi(n0) - xi(N - n0 + 2));
    x2_r(n0) =  0.5 * (xi(n0) + xi(N - n0 + 2));
    x2_i(n0) = -0.5 * (xr(n0) - xr(N - n0 + 2));
    x1_r(N / 2+2:end) = flipud(x1_r(2:N / 2));
    x1_i(N / 2+2:end) = -flipud(x1_i(2:N / 2));
    x2_r(N / 2+2:end) = flipud(x2_r(2:N / 2));
    x2_i(N / 2+2:end) = -flipud(x2_i(2:N / 2));
    Fx = x1_r + 1j * x1_i;
    Fy = x2_r + 1j * x2_i;
end