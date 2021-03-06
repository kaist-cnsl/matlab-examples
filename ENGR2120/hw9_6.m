%
% Brian D. Wendt
% 05 November 2015
% HW #9 Problem 6
%
clc; clear; format compact;

% Current at t<0
t0 = linspace(-1,0);
i0 = 1 + 0*t0;

% Current at t=0
x = [0 0];
y = [1 1.133];

% Current decay at t>0
t1 = linspace(0,1.2);
iR = 1 + 0.133 * exp(-t1/0.03125);

% Create figure
figure;
hold on; grid on;

% Graph it up
plot(x,y,'m','LineWidth',5)
plot(t0,i0,'m','LineWidth',5);
plot(t1,iR,'m','LineWidth',5);

% Add a text field with LaTeX string
% str = '$$ i_R(t)= $$';
% text(0.12,0.7,str,'Interpreter','latex','Color','m','FontSize',30)

% Set axes limits
xlim([-0.02 0.1]);
ylim([-0.1 1.2]);

% Move axes to origin **SAVE THIS PART!!**
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

% Axis labels
xlabel('Time (s)','FontSize',16);
ylabel('Current (mA)','FontSize',16);

% Reposition axes labels
xlabh = get(gca,'xlabel');
set(xlabh,'Position',get(xlabh,'Position') - [0 .1 0]);
ylabh = get(gca,'ylabel');
set(ylabh,'Position',get(ylabh,'Position') - [.1 0 0]);

