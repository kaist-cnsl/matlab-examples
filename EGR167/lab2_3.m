%
% Brian D. Wendt
% Matlab Lab #2, Part 3
% EGR-167 SP2015
%
x = [85 7 9 11 4 6 12];
labels = {'Ignore Her', ...
          'Make her laugh', ...
          'Impress her parents', ...
          'Be yourself' ...
          'Respect her', ...
          'Be spontaneous', ...
          'Get a puppy'}; 
pie(x, labels);
title('How to Get the Girl (based on successful attempts)', 'fontsize', 18);