%
% Brian D. Wendt
% 05 November 2015
% HW #9 Prob 3
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
figure('Position', [900, 900, 900, 800]);
hold on; grid on;

% Graph it up
plot(x,y,'m','LineWidth',5)
plot(t0,i0,'m','LineWidth',5);
plot(t1,iR,'m','LineWidth',5);

% Add a text field with LaTeX string
str = '$$ i_R(t)=1+0.6e^{-t/0.096} $$';
text(0.12,0.7,str,'Interpreter','latex','Color','m','FontSize',30)

% Set axes limits
xlim([-0.1 0.7]);
ylim([-0.1 1.8]);

% Move axes to origin **SAVE THIS PART!!**
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

% Axis labels
xlabel('Time (s)','FontSize',14);
ylabel('Current (mA)','FontSize',14);

% Reposition axes labels
xlabh = get(gca,'xlabel');
set(xlabh,'Position',get(xlabh,'Position') - [0 .1 0]);
ylabh = get(gca,'ylabel');
set(ylabh,'Position',get(ylabh,'Position') - [.1 0 0]);

