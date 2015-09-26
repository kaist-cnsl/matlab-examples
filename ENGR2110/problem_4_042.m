% Chapter 4, Problem 4/042
% Meriam and Kraige, Engineering Mechanics: Statics, 8e

% Determine the forces in members BC and FG of the loaded symmetrical truss.
% Show that this calculation can be accomplished by using one section and
% two equations, each of which contains only one of the two unknowns. Are
% the results affected by the statical indeterminacy of the supports at
% the base?
clc; clear; format compact;

% INPUT givens from problem statement:
%  Load on point D (N)
%  Base DK = KE, etc. (m)
%  Height FE = GF = GH (m)
D_load = 1310;
base = 2;
height = 2.4;

% Moment about point C
FG = (-D_load * height) / (2 * base);

% Moment about point F
BC = -FG;

% Display results
fprintf('BC = %6.2f N\n', BC);
fprintf('FG = %6.2f N\n', FG);