% HW #4, Problem 5 (Cengel Thermodynamics, McGraw-Hill Connect)

% A rigid 13-L vessel initially contains a mixture of liquid water and
% vapor at 120ºC with 14.5% quality. The mixture is then heated until its
% temperatureis 165ºC. Calculate the heat transfer required for this
% process.
clear; clc; format compact; format longG;

% Initial conditions
V1 = 13;    % L
T1 = 120;   % ºC
T2 = 165;   % ºC
x1 = 0.145; % quality

% Table A-2, Moran
% Saturated Water - Temp. Table
% @ T1 = 120ºC
vf1 = 1.0603 * 1e-3; % m^3/kg
vg1 = 0.8919;        % m^3/kg
uf1 = 503.50;        % kJ/kg
ug1 = 2529.3;        % kJ/kg

% Specific volume, State 1
v1 = vf1 + x1*(vg1 - vf1); % m^3/kg

% Internal energy, State 1
u1 = uf1 + x1*(ug1 - uf1); % kJ/kg

% Table A-2, Moran
% Saturated Water - Temp. Table
% @ T2 = 165ºC
vf2 = interpolate(165,160,170,1.1020,1.1143) * 1e-3; % m^3/kg
vg2 = interpolate(165,160,170,0.3071,0.2428);        % m^3/kg
uf2 = interpolate(165,160,170,674.86,718.33);        % kJ/kg
ug2 = interpolate(165,160,170,2568.4,2576.5);        % kJ/kg

% Vapor quality (x2), State 2
v2 = v1; % rigid tank, volume is constant
x2 = (v2 - vf2) / (vg2 - vf2);

% Internal energy, State 2
u2 = uf2 + x2*(ug2 - uf2); % kJ/kg

% Mass of the system
V1 = V1 * 10^(-3); % L to m^3
m = V1/v1; % kg

% Heat transfer
Qin = m * (u2 - u1);

% Display results
fprintf('u1  = %8.2f kJ/kg\n', u1);
fprintf('u2  = %8.2f kJ/kg\n', u2);
fprintf('m   = %8.2f kg\n', m);
fprintf('Qin = %8.2f kJ\n', Qin);

