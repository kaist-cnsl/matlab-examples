% Chapter 4, Problem 4/031
% Meriam and Kraige, Engineering Mechanics: Statics, 8e

% Determine the force in member CG. The force is positive if in tension,
% negative if in compression.
clc; clear; format compact;

% Truss dimensions and loads (given in problem diagram)
panel_width = 3.3; % m
panel_height = 4.2; % m
H_load = 18; %kN
G_load = 16; %kN

% Let theta be the angle HGC
theta = atand(panel_height/panel_width);

% Reaction force at point F
Fy = (H_load * panel_width * 2 + G_load * panel_width * 3) / (panel_width * 5);

% Reaction force at point A
Ay = H_load + G_load - Fy;

% Force on member CG (negative means compression)
CG = (Ay - H_load) / sind(theta);

% Display results
fprintf('CG = %6.2f kN\n', CG);