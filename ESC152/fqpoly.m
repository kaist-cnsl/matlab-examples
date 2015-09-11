function [P] = fqpoly(a)
% Calculates the global extrema of a quadratic function

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                     %
%     Brian D. Wendt - 2532713        %
%  ESC 152 Programming with MATLAB    %
%     Recitation 2  - 11/02/2011      %
%                                     %
%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

global P

% Define a1, a2, a3
a1 = a(1);
a2 = a(2);
a3 = a(3);

a = a1;
b = a2;
c = a3;
B = c;

% Find min/max using first derivative test
x = (-b)/(2*a);
y = ((4*a*c)-b^2)/(4*a);
C = [x,y];

% Term under sqrt, call it Z
Z = b^2 - 4*a*c;

% Find x-intercepts
A1 = (-b + sqrt(Z))/(2*a);
A2 = (-b - sqrt(Z))/(2*a);

% Swap A1 and A2 if A1 is bigger!
if A1 > A2
    A2_temp = A2;
    A2 = A1;
    A1 = A2_temp;
end

P = [A1 A2 0 C(1);...
     0  0  B  C(2)];
