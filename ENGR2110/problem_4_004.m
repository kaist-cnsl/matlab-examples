% Chapter 4, Problem 4/004
% Meriam and Kraige, Engineering Mechanics: Statics, 8e
clc; clear; format compact;

% Initial conditions
AB_length = 6.3; % feet
BC_length = 2.7; % feet
A_load = 180;    % lbs
C_angle = 46;    % degrees

% Let theta be angle BAC
theta = atand(BC_length/AB_length);
AC = A_load / -sind(theta);
AB = -AC * cosd(theta);
% Cn is the reaction force at roller C
Cn = (AC * cosd(theta)) / sind(C_angle);
BC = Cn * cosd(C_angle) - AC * sind(theta);

% Display results
fprintf('AB    = %7.1f lb\n', AB);
fprintf('AC    = %7.1f lb\n', AC);
fprintf('BC    = %7.1f lb\n', BC);
