% Calculate final grades
clc; clear all; format compact;

fprintf('====================================================\n');
fprintf('         ESC 152 Final Grade Calculator\n');
fprintf('====================================================\n\n');
disp('Enter student grades as a matrix, one row per');
disp('student, 8 grades per row, starting with the');
disp('3 quiz grades, then the 3 recitations, then the');
disp('project grade, and lastly, the final exam.');
fprintf('\ne.g. [ID1 Q1 Q2 Q3 R1 R2 R3 PR FE;\n      ID2 Q1 Q2 Q3 R1 R2 R3 PR FE]\n\n');
fprintf('====================================================\n\n');

% Get grade matrix
%R = input('Enter grades: ');
R = [1 88 85 81 85 86 87 88 99;
     2 90 60 77 85 77 66 88 85;
     3 67 88 78 85 85 90 88 89;]

% Call fgrade function
grades = fgrade_152(R);

% Display table
fprintf('\n--------------------------\n');
fprintf(' ID\t Final Grade\n');
fprintf('--------------------------\n');

% Iterate over grades vector
n = size(R); n = n(1); i = 1;
while i < n + 1
    fprintf(' %i\t  %6.2f\n', R(i), grades(i));
    i = i + 1;
end
fprintf('--------------------------\n\n');
