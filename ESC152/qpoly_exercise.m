%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                     %
%     Brian D. Wendt - 2532713        %
%  ESC 152 Programming with MATLAB    %
%     Lab Exercise  - 11/02/2011      %
%                                     %
%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
clc; clear all; format compact;

disp('====================================================');
disp('       Quadratic Polynomial Calculator');
disp('====================================================');

% Declare global variables
global A1; global A2; global C

% Get quadratic coefficients 
abc = input('Enter three coefficients as a row vector, [a b c]: ');
%abc = [-3 15 50]
%abc = [2 9 -20]
%abc = [-6 -9 -10]
a=abc(1); b=abc(2); c=abc(3);

% Call the maxmin function
maxmin(a,b,c);

% Output table
fprintf('\nPoint\t X\t\t\tY\n');
fprintf('A1\t %8.3f\t %8.3f\n', A1,0);
fprintf('A2\t %8.3f\t %8.3f\n', A2,0);
fprintf('B\t %8.3f\t %8.3f\n', 0,c);
fprintf('C\t %8.3f\t %8.3f\n', C(1),C(2));

% Quadratic function
x = [A1-1:0.1:A2+1];
fx = a*x.^2 + b*x + c;

% Plot it
plot(x,fx,'-m','LineWidth',1);
grid on;
xlabel('X');
ylabel('Y');
title('Quadratic Polynomial');

hold on;
% Point A1
plot(A1,0,'-ob','LineWidth',1,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','b',...
                'MarkerSize',6)
% Point A2
plot(A2,0,'-og','LineWidth',1,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','g',...
                'MarkerSize',6)
% Point B
plot(0,c,'-sr','LineWidth',1,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','r',...
                'MarkerSize',8)
% Point C
plot(C(1),C(2),'-dm','LineWidth',1,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','m',...
                'MarkerSize',8)
% Legend
legend('f(x)','A1 (x-int)','A2 (x-int)','B (y-int)','C (min/max)');
hold off;