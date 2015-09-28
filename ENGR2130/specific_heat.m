
% Empirical specific heat equation for Hydrogen
clear; clc; format longG;

% Table A-2(c), Cengel (Cp function values for Hydrogen)
a = 29.11;
b = -0.1916e-2;
c = 0.4003e-5;
d = -0.8704e-9;

% Ideal gas constant
R = 8.314;

% Molecular weight of Hydrogen (kg/kmol)
M = 2.016;

% Initial and final temperatures (K)
T1 = 400;
T2 = 500;

% Change in Enthalpy (H), which is the integral of Cp(T)*dT from T1 to T2
H = a*(T2-T1) + (b/2)*(T2^2-T1^2) + (c/3)*(T2^3-T1^3) + (d/4)*(T2^4-T1^4);
U_kj_kmol = H - R*(T2-T1);

% Divide by molecular weight to get kJ/kg
U = U_kj_kmol/M;

% Display results
fprintf('U  = %5.f kJ/kg\n', U);