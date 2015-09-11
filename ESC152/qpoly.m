%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                     %
%     Brian D. Wendt - 2532713        %
%  ESC 152 Programming with MATLAB    %
%     Recitation 2  - 11/02/2011      %
%                                     %
%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
clc; clear all; format compact;

disp('====================================================');
disp('       Quadratic Polynomial Calculator');
disp('====================================================');

% Declare global variables
global P

% Get quadratic coefficients 
a = input('Enter three coefficients as a row vector, [a b c]: ');
%a = [-4 20 30]

% Call the fqpoly function
fqpoly(a);

% Output table
fprintf('\nPoint\t X\t\t\tY\n');
fprintf('A1\t %8.3f\t %8.3f\n', P(1,1), P(2,1));
fprintf('A2\t %8.3f\t %8.3f\n', P(1,2), P(2,2));
fprintf('B\t %8.3f\t %8.3f\n',  P(1,3), P(2,3));
fprintf('C\t %8.3f\t %8.3f\n',  P(1,4), P(2,4));

% Call plot function
fqpolyplot(a,P);