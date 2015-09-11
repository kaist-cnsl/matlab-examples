%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                     %
%     Brian D. Wendt - 2532713        %
%  ESC 152 Programming with MATLAB    %
%     Recitation #1 - 09/22/2011      %
%                                     %
%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
clc; format compact; format bank;

disp('====================================================');
disp('              Vapor Pressure Calculator');
disp(' Find vapor pressure (p) using the Antoine equation');
disp('====================================================');

% Material constants for water
A = 16.2620;
B = 3799.89;
C = 226.35;

% Get temperature range
disp('Enter desired temperature range (Tmin - Tmax) and interval in degrees K below.');
Tmin = input('Tmin: ');
Tmax = input('Tmax: ');
Tint = input('Temperature Interval: ');

% Convert to Celsius
TminC = Tmin - 273.15;
TmaxC = Tmax - 273.15;

% Temperature array
T = [Tmin:Tint:Tmax];
Tc = [TminC:Tint:TmaxC];
T = T';
Tc = Tc';

% Calculate vapor pressure in kPa
p = exp(A - (B ./ (C + Tc)));

% Convert vapor pressure to bar
p = p ./ 100;

% Build data table
tableTp(:,1) = T;
tableTp(:,2) = p;

% Display data table
disp(' ');
disp('======================================');
disp('      Vapor Pressure of Water');
disp('======================================');
disp(' ');
disp('--------------------------------------');
disp('         T/K           p/bar')
disp('--------------------------------------');
disp(tableTp);
disp(' ');
disp('--------------------------------------');

% Graph it
plot(T,p)
xlabel('Temperature (K)')
ylabel('Vapor Pressure (p/bar)')
title('Vapor Pressure Curve')