% Cheng-Yen Yang (b03901086) 1052-ADSP
% Reference:
% http://www.engineeringproductivitytools.com/stuff/T0001/PT10.HTM

x1 = [0, 1, 2, 3];
x2 = [0, 2, 4, 6];

[X_1 X_2] = fftreal(x1, x2)
function[ Fx, Fy ] = fftreal( x , y )
    
    % z(n)=x(n)+y(n)
    % FFT z(n) 
    z_fft = fft(x + y * 1i) ;
    z_fft_real = real(z_fft) ;
    z_fft_imag = imag(z_fft) ;
    N = length( z_fft_real ) ;
    
    % Spilt
    [Fx_real,Fx_imag,Fy_real,Fy_imag] = deal(zeros(N,1)) ;
    Fx_real(1) = z_fft_real(1) ;
    Fx_imag(1) = 0 ;
    Fy_real(1) = z_fft_imag(1) ;
    Fy_imag(1) = 0 ;
    M = N/2+1 ;
    Fx_real(M) = z_fft_real(M) ;
    Fx_imag(M) = 0 ;
    Fy_real(M) = z_fft_imag(M) ;
    Fy_imag(M) = 0 ;
    k1 = 2:(N/2) ;
    k2 = (N/2)+2:N ;
    Fx_real(k1) = 0.5 * z_fft_real(k1) + 0.5 * z_fft_real(N-k1+2) ;
    Fx_real(k2) = flipud( Fx_real(k1) ) ;
    Fx_imag(k1) = 0.5 * z_fft_real(k1) - 0.5 * z_fft_real(N-k1+2) ;
    Fx_imag(k2) = -flipud( Fx_imag(k1) ) ;
    Fy_real(k1) = 0.5 * z_fft_imag(k1) + 0.5 * z_fft_imag(N-k1+2) ;
    Fy_real(k2) = flipud( Fy_real(k1) ) ;
    Fy_imag(k1) = -0.5 * z_fft_imag(k1) - 0.5 * z_fft_imag(N-k1+2) ;
    Fy_imag(k2) = -flipud( Fy_imag(k1) ) ;
    
    % Reconstruct
    Fx = Fx_real + Fx_imag * 1j ;
    Fy = Fy_real + Fy_imag * 1j ;

    
end