function getmusic(score, beat, name)
    fs = 8000;
    t = 0:1/fs:0.25;
    tspace = .05;
    fr = 2^(1/12);
   

    A4 = 440;
    B4 = A4*fr^2;
    C4 = A4*fr^(-9);
    D4 = A4*fr^(-7);
    E4 = A4*fr^(-5);
    F4 = A4*fr^(-4);
    G4 = A4*fr^(-2);
    C5 = A4*fr^3;

    keySet = {1, 2, 3, 4, 5, 6, 7, 8};
    valueSet = {cos(C4*2*pi*t), cos(D4*2*pi*t), ...
        cos(E4*2*pi*t), cos(F4*2*pi*t), ...
        cos(G4*2*pi*t), cos(A4*2*pi*t), ...
        cos(B4*2*pi*t), cos(C5*2*pi*t)};
    mapObj = containers.Map(keySet,valueSet);
        
    xspace = zeros(size(tspace));

    res = [];
    for i = 1:size(score, 2)
        for j = 1:beat(i)
          res = [res, mapObj(score(i)), xspace];
        end
    end
        

    str = '.wav';
    tmp = strcat(name, str);
    audiowrite(tmp, res, fs);
end