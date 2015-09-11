function [] = fqpolyplot(a,P)
% Plots a quadratic

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                     %
%     Brian D. Wendt - 2532713        %
%  ESC 152 Programming with MATLAB    %
%     Recitation 2  - 11/02/2011      %
%                                     %
%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

% Xmin and Xmax
xmin = P(1,1) - abs((P(1,1) * .2));
xmax = P(1,2) + abs((P(1,2) * .2));
x = linspace(xmin,xmax,400);

% Quadratic function
A = a(1); b = a(2); c = a(3);
fx = A*x.^2 + b*x + c;

ymin = A*xmin.^2 + b*xmin + c;
ymax = A*xmax.^2 + b*xmax + c;

% Plot it
plot(x,fx,'-r');
xlabel('X');
ylabel('Y');
title('Wendt''s Quadratic Polynomial');
hold on;

% xmin
plot(xmin,ymin,'-ob')
% xmax
plot(xmax,ymax,'-ob')
% Point A1
plot(P(1,1), P(2,1),'-sg')
% Point A2
plot(P(1,2),P(2,2),'-sg')
% Point B
plot(P(1,3),P(2,3),'-dm')
% Point C
plot(P(1,4),P(2,4),'-hk')

% Legend
legend('f(x)','xmin','xmax','A1','A2','B','C');
hold off;

