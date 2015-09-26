% Chapter 4, Problem 4/033
% Meriam and Kraige, Engineering Mechanics: Statics, 8e

% Determine the forces in members BC and CG.
% The force is positive if in tension, negative if in compression.
clc; clear; format compact;

% INPUT givens from problem statement:
%  Load hanging from point A (kN)
%  Base length AG = BC = CD (m)
%  Height length BG = CF (m)
A_load = 35;
base = 2.2;
height = 2.0;

% Angle BCG (degrees)
BCG = atand(height/base);

% Tension load on member CG
CG = A_load / sind(BCG);

% Load on member BC
BC = (A_load * base) / height;

% Display results
fprintf('BG = %6.2f kN\n', BC);
fprintf('CG = %6.2f kN\n', CG);