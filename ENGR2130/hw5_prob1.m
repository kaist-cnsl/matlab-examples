% HW #5, Problem 1 (Cengel Thermodynamics, McGraw-Hill Connect)
clear; clc; format compact; format shortG;

P = 120;          % kPa
T = 41 + 273.15;  % K
V1 = 2;           % m/s
D1 = 3.3;         % m
D2 = 15.0;        % m
d = 1;            % m
R = 0.287;        % kPa*m^3 / kg*K

rho = P/(R*T);
A1 = (pi*d^2)/4;
m_dot = rho*A1*V1;
v1 = (pi*D1^3)/6;
m1 = rho*v1;
v2 = (pi*D2^3)/6;
m2 = rho*v2;
t = ((m2-m1)/m_dot)/60;

% Display results
fprintf('t = %7.2f minutes\n', t);