% HW #5, Problem 2 (Cengel Thermodynamics, McGraw-Hill Connect)
clear; clc; format compact; format shortG;

d = 0.26; % m
P1 = 200; % kPa
T1 = 20;
V1 = 3.6;

% from Tables
v1 = 0.11394;
v2 = 0.13730;

V_dot_1 = (pi/4)*d^2*V1;
m_dot = V_dot_1/v1;

V_dot_2 = m_dot*v2;
V2 = (v2/v1)*V1;



% Display results
fprintf('V_dot_1 = %7.4f m^3/s\n', V_dot_1);
fprintf('m_dot   = %7.4f kg/s\n', m_dot);
fprintf('V_dot_2 = %7.4f m^3/s\n', V_dot_2);
fprintf('V2      = %7.4f m/s\n', V2);