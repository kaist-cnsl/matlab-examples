% Problem 4/015
% Meriam and Kraige, Engineering Mechanics: Statics, 8e

% Determine the forces in members BC and BG of the loaded truss.
% The forces are positive if in tension, negative if in compression.
clc;format compact

load_at_points_C_and_D = 4.1; % kN
load_at_point_G = 3.3; % kN

% reaction force at point A
Ay = (2*load_at_points_C_and_D + load_at_point_G) / 2;

% truss forces
AB = -Ay / sind(60);
BG = load_at_point_G / (2*sind(40.89));
BA = -AB;
BC = -(BA*sind(60) - BG*sind(40.89)) / sind(60);

% Display results
fprintf('BC = %6.2f N\n', BC);
fprintf('BG = %6.2f N\n', BG);
