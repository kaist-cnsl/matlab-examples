%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    Solving Systems of Equations      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; format compact; format bank;

% System of three equations
A = [3 -0.1 -0.2; 0.1 7 -0.3; 0.3 -0.2 10];
B = [7.85; -19.3; 71.4];

% Since A*X=B, X=inv(A)*B
X = inv(A) * B


