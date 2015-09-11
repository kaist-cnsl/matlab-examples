%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                     %
%     Brian D. Wendt - 2532713        %
%  ESC 152 Programming with MATLAB    %
%     Lab Exercise  - 09/30/2011      %
%                                     %
%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
clc; format compact;

disp('====================================================');
disp('             Basketball Drop Problem');
disp('====================================================');

% Assign constants
g = 9.81;
Cd = 0.5;
rho = 1.2;
m = 0.624;
r = 0.117;
A = pi*r^2;

% Get Tmax and deltaT
Tmax = input('Total time (s)? ');
deltaT = input('Time interval (s)? ');
t = [0:deltaT:Tmax]';

% Find velocity
v = sqrt((2*m*g)/(rho*A*Cd))*(1-exp(-(sqrt((rho*g*Cd*A)/(2*m))*t)));

% Build data table (Make sure they're both COLUMN vectors!!)
tableTV = [t v];

% Display table
disp('-------------------------------');
disp('  Time (s)  Velocity (m/s)')
disp('-------------------------------');
disp(tableTV);
disp('-------------------------------');

% Graph it
plot(t,v,'-om')
xlabel('Time (s)')
ylabel('Velocity (m/s)')
title('Basketball Drop Problem (p. 80)')