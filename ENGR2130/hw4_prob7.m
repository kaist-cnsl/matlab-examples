% HW #4, Problem 5 (Cengel Thermodynamics, McGraw-Hill Connect)

% An insulated piston-cylinder device contains 6L of saturated liquid water
% at a constant pressure of 175 kPa. Water is stirred by a paddle wheel
% while a current of 6.6A flow for 20 minutes through a resistor placed in
% the water. If one half of the liquid is evaporated during this constant-
% pressure process, and the paddlewheel work amounts to 360 kJ, determine
% the voltage of the source.
clear; clc; format compact; format shortG;

% Initial conditions
V1 = 6 * 1e-3; % L -> m^3
P = 175; % kPa
I = 6.6; % Amps
t = 20 * 60; % min -> seconds
x = 0.5;

% Work input from paddlewheel
W_sh = 360; % kJ

% Enthalpy @ 1.75 bar for "saturated liquid water"
% Table A-3, p. 929 Moran
hf = interpolate(1.75,1.50,2.00,467.11,504.70);  % kJ/kg
hfg = interpolate(1.75,1.50,2.00,2226.5,2201.9); % kJ/kg
vf = interpolate(1.75,1.50,2.00,1.0528,1.0605) *  1e-3;  % m^3/kg

% Enthalpy and specific volume
h1 = hf;
v1 = vf;
h2 = hf + (x * hfg);

% Mass of the system
m = V1 / v1;

% Enthalpy change
H = m * (h2 - h1);

% Electrical work
W_elec = H - W_sh;

% Volts
V = (W_elec*1000) / (I*t);

% Display results
fprintf('V  = %5.1f volts\n', V);


