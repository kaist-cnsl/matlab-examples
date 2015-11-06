% Chapter 4, Problem 4/040
% Meriam and Kraige, Engineering Mechanics: Statics, 8e

% Calculate the forces in members BC, CD, and CG of the loaded truss 
% composed of equilateral triangles, each of side length 7 m. The forces 
% are positive if in tension, negative if in compression.
clc; clear; format compact;

% Length of each side of triangles
L = 7;
% Hanging load at point H
H = 4.5;
% Tension at point E
E = 5.8;

% Calculate the tension at point D
D = (H*2*L + E*sind(30)*6*L) / (L*3 + L/2);

% Calculate CG (Sum Fy)
CG = (E*sind(30) - D) / sind(60);

% Calculate CD (Moment about G)
CD = (E*sind(30)*(3*L) - D*(L/2)) / (L*sind(60));

% Calculate GH (Moment about C)
GH = (6*L - E*sind(30)*2*L) / (L*sind(60));

% Calculate BC (Moment about M)


% Display results
fprintf('BC = %6.2f kN\n', GH);
fprintf('CD = %6.2f kN\n', CD);
fprintf('CG = %6.2f kN\n', CG);