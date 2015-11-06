%
% Brian D. Wendt
% 05 November 2015
% HW #9
%
clc; clear; format compact;

% the decay function
t = linspace(0,1);
iR = 1 + 0.6 * exp(-t/0.096);

% the grapherooni
plot(t,iR,'LineWidth',4);
grid on;
xlim([-0.1 1]);
ylim([0 1.7]);
PlotAxisAtOrigin(t,iR);