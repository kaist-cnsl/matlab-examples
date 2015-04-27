%
% Brian D. Wendt
% Matlab Lab #2, Part 1
% EGR-167 SP2015
% 
%  "lab2_1.m"
%
% 19 April 2015
%
% Plots 3 trig functions on the same graph.
%

x = linspace(0,2*pi);

% Configure the plot axes...
% http://www.mathworks.com/help/matlab/ref/set.html
% http://www.mathworks.com/help/matlab/ref/gca.html
set(gca,...
 'xlim', [0 2*pi], ...
 'ylim', [-1.2 1.2], ...
 'xtick', (0:pi/2:2*pi), ...
 'xticklabel',{'0' '\pi/2' '\pi' '3\pi/2' '2\pi'}, ...
 'fontsize',14)

hold on;
grid on;

plot(x,tan(x), 'g', 'linewidth', 2);
plot(x,cos(x), 'r', 'linewidth', 2);
plot(x,sin(x), 'b', 'linewidth', 2);

legend('tan(x)','cos(x)', 'sin(x)');
title('Matlab Lab 2, Part 1');
xlabel('x-axis');
ylabel('y-axis');

hold off;