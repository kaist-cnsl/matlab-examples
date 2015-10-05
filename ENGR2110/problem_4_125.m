% Chapter 4, Problem 4/125
% Meriam and Kraige, Engineering Mechanics: Statics, 8e

clc; clear; format compact;


% Horizontal distance from B to A (in)
BA_horz = 46;
% Vertical distance from B to A (in)
BA_vert = 14;
% Horizontal distance from A to O (in)
AO_horz = 6;
% Vertical distance from B to O (in)
BO_vert = 12;
% Weight of the bucket and load (lb)
W = 4730;

theta = atand(BA_vert/BA_horz);
AB = -( W*(2*BA_horz + AO_horz) ) / ( (sind(theta)*(BA_horz+AO_horz)) + (cosd(theta)*BO_vert) );
Ox = -AB*cosd(theta);
Oy = W + AB*sind(theta);
O = sqrt(Ox^2 + Oy^2);

% Display results
fprintf('theta = %10.2f º\n', theta);
fprintf('AB    = %10.2f lb\n', AB);
fprintf('Ox    = %10.2f lb\n', Ox);
fprintf('Oy    = %10.2f lb\n', Oy);
fprintf('O     = %10.2f lb\n', O);