%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                     %
%     Brian D. Wendt - 2532713        %
%  ESC 152 Programming with MATLAB    %
%     Lab Exercise  - 10/07/2011      %
%                                     %
%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
clc; format compact; clear all;

fprintf('====================================================\n');
fprintf('             Basketball Drop Problem\n');
fprintf('====================================================\n\n');
fprintf('   A basketball is dropped down from a helicopter.\n');
fprintf('     Model its velocity as a function of time.\n\n');
fprintf('====================================================\n\n');

% Assign constants
g = 9.81;
Cd = 0.5;
rho = 1.2;

% Get mass and radius of basketball
m = 0.624;
r = 0.117;
m = input('Mass of the basketball (kg)? ');
r = input('Radius of the basketball (m)? ');

% Get time data file
t = load('basketball.txt');

% D.R.Y.!!
A = pi*r^2;
Q = (rho*A*Cd)/(2*m);

% Find velocity
vTerm = sqrt(Q^(-1) * g);
v = vTerm * (1-exp(-(sqrt(Q*g)*t)));

% Write data table to Word doc
VofT = [t v]';
docfile = fopen('fall.txt','w');
fprintf(docfile, '-------------------------------\n');
fprintf(docfile, '    Basketball Drop Problem\n');
fprintf(docfile, '-------------------------------\n');
fprintf(docfile, '   Time (s)\t Velocity (m/s)\n');
fprintf(docfile, '-------------------------------\n');
fprintf(docfile, '   %6.3f \t\t %6.3f \n', VofT);
fprintf(docfile, '-------------------------------\n\n');
fprintf(docfile, 'Terminal Velocity = %6.3f m/s.', vTerm);
fclose('all');

% Display table in Matlab
fprintf('\n-------------------------------\n');
fprintf('   Time (s)\t Velocity (m/s)\n');
fprintf('-------------------------------\n');
fprintf('   %6.3f \t\t %6.3f \n', VofT);
fprintf('-------------------------------\n\n');
fprintf('Terminal Velocity = %6.3f m/s.\n\n', vTerm);

% Graph it
plot(t,v,'-om');
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Basketball Drop Problem v.2.0');
