E0 = 0;
E1 = inf;
delta = 0.0001;

N = 21;
k = 10; % (N + 1) / 2
F = zeros(1, k+2); % normalized freq
P = zeros(1, k+2); % local max/min
size = 10000;
p_b = [1100 / 5000, 2500 / 5000]; % pass band
t_b = [900 / 5000, 1100 / 5000]; % transition band

% step 1
for i = 1:k+2
    F(i) = i * 0.04;
    P(i) = i * 0.04;
    if F(i) > t_b(1) && F(i) < t_b(2) % Exclude trans band
        F(i) = 0.33; %0.20 is in trans band-> 0.33
        P(i) = 0.33;
    end
end

it = 0; %iterator, # of iteration
% step 5, Case A requires iteration!
while ((E1 - E0 > delta) || (E1 - E0 < 0)) 
    it = it + 1;
    it
    F = P;
    E1 = E0;
    W = w(F);
    m = zeros(k+2, k+2);
    
    % step 2
    m(:,1) = 1;
    m(:,k+2) = (-1).^transpose(0:11)./transpose(W);
    m(:,2:k+1) = cos(2*pi*transpose(F)*(1:10));
    hd = transpose(h(F));
    s = m\hd; % left divide

    x = linspace(0 , 0.5 , size);
    R = zeros(1, size);
    
    % step 3
    for i = 1:k+1
        R = R + s(i) * cos(2 * pi * (i-1) * x);
    end
    H_F = h(x);
    W_F = w(x);
    err = (R - H_F).*W_F; %element-wise multiply
    
    % step 4
    [ymax , xmax , ymin , xmin] = extrema(err); % please see ref
    
    myx = sort_x(xmax, xmin);
    tmp = round(myx * 0.05) / 1000;
    mat = tmp * 2000 * 10;
    mat(1) = 1;
    E0 = max(abs((R(mat)-h(tmp)) .* w(tmp)));
    E0
    
    P = tmp;
end

% step 5, case B...
figure;
plot(x , R);
title('Frequency Response');

% step 6, impulse response
h_f = zeros(N , 1);
h_f(k+1) = s(0+1);

for i=1:k
    h_f(k+1+i) = s(1+i) / 2;
    h_f(k+1-i) = s(1+i) / 2;
end

figure;
plot(h_f);
title('Impulse Response');