%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                     %
%     Brian D. Wendt - 2532713        %
%        MTH 182 Calculus II          %
%                                     %
%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
clc; clear all; format compact;

disp('====================================================');
disp('       Error Bound for an Alternating Series');
disp('      S(n) = ((-1)^(n+1)) / ((n + 4)*(n + 8))');
disp('====================================================');

% Size of the series S(N)
N = input('Enter a value ''n'' for S(n) : ');
fprintf('\nCalculating...\n')

% S is a_n sequence
S = [];
n = [1:1:N];
S(n) = ((-1).^(n+1)) ./ ((n + 4).*(n + 8));

% Run the calculation
i = size(S);
i = i(2);
j = 1;
sum = 0;
while j < i
    sum = sum + S(j);
    j = j + 1;
end

% Print S(n) =
fprintf('\nS(%1.0f) = %2.7f \n',j,sum)

% Graph it
n_plot = [1:1:45];
plot(n_plot,S(1:45),'-ob')
title('Error Bound for an Alternating Series')