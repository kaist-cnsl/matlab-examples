% Problem 3/051 Statics

% A torque (moment) of 27 N·m is required to turn the bolt about its axis. 
% Determine P and the magnitudes of the forces between the smooth hardened 
% jaws of the wrench and the corners A and B of the hexagonal head. Assume 
% that the wrench fits easily on the bolt so that contact is made at
% corners A and B only.
clc; clear; format compact;

% INPUT VALUES from problem statement:
%  Torque (moment) required to turn bolt (N·m)
%  Hex head bolt diameter (mm)
%  Wrench length (mm)
torque = 27;
hex_head_diameter = 20;
wrench_length = 170;

% Length (L) of one side of hexagonal bolt head
L = (hex_head_diameter/2) / cosd(30); % (mm)

% Magnitude of force (P) on wrench arm
P = torque / (wrench_length/1000); % (N)

% Magnitude of force (B) on upper right corner of bolt head
B = ((torque / ((L/2)/1000)) + P) / 2; % (N)

% Magnitude of force (A) on lower left corner of bolt head
A = B - P;

% Display results
fprintf('P = %7.2f N\n', P);
fprintf('A = %7.2f N\n', A);
fprintf('B = %7.2f N\n', B);

