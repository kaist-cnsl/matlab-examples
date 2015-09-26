% Problem 3/102
% Meriam and Kraige, Engineering Mechanics: Statics, 8e

% The uniform bar with end rollers weighs 75 lb and is supported by the
% horizontal and vertical surfaces and by the wire AC. Calculate the
% tension T in the wire and the reactions against the rollers
% at A and at B.
clc; clear; format compact;

% INPUT VALUES from problem statement:
%  Weight of the bar (lb)
%  Base distance from point A to corner (feet)
%  Height from corner to point B (feet)
%  Height from point B to point C (feet)
bar_weight = 75;
base = 3.6;
height = 2.5;
bc = 1.4;

% We'll call the corner point L
% Theta is the angle C-A-L
theta = atand((bc+height)/base);

% Alpha is the angle B-A-L
alpha = atand((height)/base);

% AB is the length of the bar
ab = sqrt(base^2 + height^2);

% AD is the perpendicular distance from A to the weight vector
ad = 0.5*ab*cosd(alpha);

% B is the reaction force at point B
B = (bar_weight*ad)/height;

% T is the tension of the wire AC
T = B/cosd(theta);

% A is the reaction force at point A
A = bar_weight - T*sind(theta);

% Display results
fprintf('T = %6.2f lb\n', T);
fprintf('A = %6.2f lb\n', A);
fprintf('B = %6.2f lb\n', B);
