% HW #4, Problem 5 (Cengel Thermodynamics, McGraw-Hill Connect)

% A piston-cylinder device contains 0.133 kg of air initially at
% 1.9 MPa and 368 ºC. The air is first expanded isothermically to
% 540 kPa, then compressed polytropically with a polytropic
% exponent of 1.152 to the initial pressure, and finally compressed
% at the constant pressure to the initial state.
% Determine the boundary work for each process and the net work of
% the cycle. Round all answers to two decimal places.
clc; clear; format compact;

% Initial conditions
m  = 0.133; % kg
P1 = 1.9 * 1000; % MPa -> kPa
P2 = 540; % kPa
T1 = 368 + 273.15; % ºC -> K
n  = 1.152; % polytropic process index (exponent)

% Gas constant for Air
% Table A-2, Cengel, "Ideal-gas specific heats of various common gases"
R  = 0.2870; % kJ/kg*K

% Process 1-2 (isothermal)
T2 = T1;
V1 = (m * R * T1) / P1; % m^3
V2 = (m * R * T2) / P2; % m^3
W_12 = P1*V1 * log(V2/V1); % kJ

% Process 2-3 (polytropic)
P3 = P1;
V3 = ((P2*V2^n)/P3)^(1/n); % m^3
W_23 = (P3*V3 - P2*V2) / (1-n); % kJ

% Process 3-1 (isobaric)
W_31 = P3 * (V1-V3);

% Net work of the cycle
W_net = W_12 + W_23 + W_31;

% Display results
fprintf('W(1-2) = %7.2f kJ\n', W_12);
fprintf('W(2-3) = %7.2f kJ\n', W_23);
fprintf('W(3-1) = %7.2f kJ\n', W_31);
fprintf('W(net) = %7.2f kJ\n', W_net);



