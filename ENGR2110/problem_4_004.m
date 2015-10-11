% Chapter 4, Problem 4/004
% Meriam and Kraige, Engineering Mechanics: Statics, 8e
clc; clear; format compact;

% Initial conditions
AB_length = 6.3; % feet
BC_length = 2.7; % feet
A_load = 180;    % lbs
C_angle = 46;    % degrees

% Let angle BAC be theta
theta = atand(BC_length/AB_length);
AC = A_load / -sind(theta);
AB = -AC * cosd(theta);
% Cn is the reaction force at roller C
Cn = (AC * cosd(theta)) / sind(C_angle);
BC = -((AC * sind(theta)) - (Cn * cosd(C_angle)));

% Display results
fprintf('Positive forces are in tension and\n');
fprintf('negative forces are in compression.\n');
fprintf('AB    = %6.f lb\n', AB);
fprintf('AC    = %6.f lb\n', AC);
fprintf('BC    = %6.f lb\n', BC);
