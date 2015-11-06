%
% Brian D. Wendt
% 05 November 2015
% HW #9
%
clc; clear; format compact;

% Current at t<0
t0 = linspace(-1,0);
i0 = 1 + 0*t0;

% Current at t=0
x = [0 0];
y = [1 1.6];

% Current decay at t>0
t1 = linspace(0,1);
iR = 1 + 0.6 * exp(-t1/0.096);

% Create figure
figure('Position', [900, 900, 600, 600]);
hold on; grid on;

% Graph it up
plot(x,y,'m','LineWidth',5)
plot(t0,i0,'m','LineWidth',5);
plot(t1,iR,'m','LineWidth',5);

% Set axes limits
xlim([-0.1 0.7]);
ylim([-0.1 1.8]);

% Move axes to origin
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';