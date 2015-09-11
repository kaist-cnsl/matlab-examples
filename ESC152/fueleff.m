%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                     %
%     Brian D. Wendt - 2532713        %
%  ESC 152 Programming with MATLAB    %
%     Lab Exercise  - 11/09/2011      %
%                                     %
%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
clc; clear all; format compact;

disp('====================================================');
disp('           Fuel Efficiency Calculator');
disp('====================================================');

% Get data
%volume = input('Enter volume from the pump display: ');
%trip = input('Enter trip reading from the odometer: ');
%location = input('Enter your location (US or EU): ');

% Start at "1", step by "2", stop at "10"
for i = 1:2:10
    fprintf('Iteration # %1i \n', i);
end

fprintf('\n');

% Assume "1" for the increment step
for i = 1:5
    fprintf('Iteration # %1i \n', i);
end

fprintf('\n');

% Compute the factorial using a loop
j = 1;
for i = 1:8;
    j = j * i;
    fprintf('%1i! = %5i \n', i, j);
end

fprintf('\n');

% Sum of a series
n = 10000;
S = 0;
for k = 1:n
    S = S + (-1)^k*k/2^k;
end
fprintf('S = %f \n', S);