%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                     %
%     Brian D. Wendt - 2532713        %
%  ESC 152 Programming with MATLAB    %
%     Lab Exercise  - 09/30/2011      %
%                                     %
%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
clc; format compact;

disp('====================================================');
disp('             Bouncing Ball Problem');
disp('====================================================');

% Get starting height in meters
h = input('Starting height (meters)? ');

% Get number of bounces
n = input('How many bounces? ');
n = [0:1:n]';

% Gravity (m/s^2)
g = 9.81;

% Max height
Hmax = 0.85.^(2*n)*h;

% Build data table (Make sure they're both COLUMN vectors!!)
tableNH = [n Hmax];

% Display table
disp('-------------------------------');
disp('  Bounce (n)  Height (Hmax)')
disp('-------------------------------');
disp(tableNH);
disp('-------------------------------');

% Graph it
plot(n,Hmax,'ob')
xlabel('Number of Bounces (n)')
ylabel('Height in Meters (Hmax)')
title('Bouncing Ball Problem (p. 80)')