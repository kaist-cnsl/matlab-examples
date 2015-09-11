% Calculate final grades
clc; clear all; format compact;

fprintf('====================================================\n');
fprintf('             Final Grade Calculator\n');
fprintf('====================================================\n\n');
disp('Enter student grades as a matrix, one row per');
disp('student, 10 grades per row, starting with the');
disp('6 HW grades, then the 3 Midterms, then the Final.');
fprintf('\ne.g. [ID HW1 HW2 HW3 HW4 HW5 HW6 MT1 MT2 MT3 FE;\n      ID HW1 HW2 HW3 HW4 HW5 HW6 MT1 MT2 MT3 FE]\n\n');
fprintf('====================================================\n\n');

% Get grade matrix
%R = input('Enter grades: ');
R = [1 8 10 6 9 10 9 91 71 81 85; 2 5 5 6 1 8 6 59 72 66 59; 3 6 8 10 4 5 9 55 65 75 78; 4 7 7 8 8 9 8 83 82 81 84]

% Call fgrade function
grades = fgrade(R);

% Display table
fprintf('\n--------------------------\n');
fprintf(' ID\tFinal Grade\n');
fprintf('--------------------------\n');

% Iterate over grades vector
n = size(R); n = n(1); i = 1;
while i < n + 1
    fprintf(' %i\t  %6.2f\n', R(i), grades(i));
    i = i + 1;
end
fprintf('--------------------------\n\n');
