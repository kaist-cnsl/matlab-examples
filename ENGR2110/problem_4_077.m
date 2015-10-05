% Chapter 4, Problem 4/077
% Meriam and Kraige, Engineering Mechanics: Statics, 8e

clc; clear; format compact; format shortG;

% Length of section CB (ft)
CB = 5.4;
% Height of section AD (ft)
AD = 3.9;
% Pulley radius (ft)
pulley = 6/12;
% Hanging weight (lb)
weight = 670;

theta = atand(AD/CB);
BD = ( weight*(2*CB + pulley) - weight*pulley ) / ( sind(theta)*CB );
Ax = BD*cosd(theta) - weight;
Ay = weight - BD*sind(theta);
A = sqrt(Ax^2 + Ay^2);

% Display results
fprintf('theta = %8.2fº\n', theta);
fprintf('BD    = %8.2f lb\n', BD);
fprintf('Ax    = %8.2f lb\n', Ax);
fprintf('Ay    = %8.2f lb\n', Ay);
fprintf('A     = %8.2f lb\n', A);