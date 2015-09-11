%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                     %
%     Brian D. Wendt - 2532713        %
%  ESC 152 Programming with MATLAB    %
%     Lab Exercise  - 09/28/2011      %
%                                     %
%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
clc; format compact; format bank;

disp('====================================================');
disp('       Electrical Resistive Network Analysis');
disp('====================================================');

% Get voltage values
disp('Enter battery voltages (E/Volts):');
E = input('[E1 E2]: ');
E = E';
E(3,1) = 0;

% Get resistance values
disp('Enter resistor values (R/Ohms): [R1 R2 R3]');
R1 = input('R1: ');
R2 = input('R2: ');
R3 = input('R3: ');

% Resistance matrix
R = [R1 0 -R3; 0 R2 R3; 1 -1 1];

% Find the Current in Ohms
I = inv(R) * E;

% Format and display output
I1 = I(1,1);
I2 = I(2,1);
I3 = I(3,1);
i1 = sprintf('I1 = %s amperes.', num2str(I1));
i2 = sprintf('I2 = %s amperes.', num2str(I2));
i3 = sprintf('I3 = %s amperes.', num2str(I3));
disp('====================================================');
disp(i1);
disp(i2);
disp(i3);