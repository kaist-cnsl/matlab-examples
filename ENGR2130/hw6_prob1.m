% HW #6, Problem 1 (Cengel Thermodynamics, McGraw-Hill Connect)
clear; clc; format compact; format short;

% Turbine inlet conditions
P1 = 1000; % kPa
T1 = 500;  % C
A1 = 0.2;  % m^2
V1 = 40;   % m/s

% Turbine exit conditions
P2 = 100;  % kPa
T2 = 150;  % C
A2 = 0.94; % m^2

% Temperature conversions
T1 = T1 + 273.15; % K
T2 = T2 + 273.15; % K

% Ideal Gas Properties of Air (Table A-??, Cengel)
%  NOTE: Interpolation inputs vary with T1 and T2!!
h1 = interpolate(T1,760,780,778.18,800.03);
h2 = interpolate(T2,420,430,421.26,431.43);

% Mass flow rate (m_dot)
R = 0.287; % kJ/kg*K (Table A-2, Cengel)
rho_1 = P1 / (R * T1); % kg/m^3
m_dot = rho_1 * A1 * V1;

% Power produced by turbine (W_dot)
rho_2 = P2 / (R * T2); % kg/m^3
V2 = m_dot / (rho_2 * A2); % m/s
W_dot = m_dot * ((h1*1000 - h2*1000) + ((V1^2 - V2^2)/2)) * (1/1000); % kW

% Display results
fprintf('m_dot = %7.2f kg/s\n', m_dot);
fprintf('W_dot = %7.f KW\n', W_dot);
