clc;
clear;


% score=[1,1,5,5,6,6,5]; %1:Do,2:Re,3:Mi,.....
% beat=[1, 1, 1, 1, 1, 1, 2]; % tempo
score=[1,1,5,5,6,6,5, 4, 4, 3, 3, 2, 2, 1]; %1:Do,2:Re,3:Mi,.....
beat=[1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 2]; % tempo
name = 'twinkle';

getmusic(score, beat, name); 