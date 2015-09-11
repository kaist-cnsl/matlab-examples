%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                     %
%     Brian D. Wendt - 2532713        %
%  ESC 152 Programming with MATLAB    %
%     Lab Exercise  - 10/17/2011      %
%                                     %
%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
clc; format compact; clear all;

% ==================================================
%   See Problem 10, p.151 - Squirrel Trajectory
% ==================================================

% Time
t = 0:1.5:30;

% Position vector
xt = -0.28*t.^2 + 6.5*t + 61;
yt = 0.18*t.^2 - 8.5*t + 65;

% Velocity vector (1st derivative of position)
xt_prime = -(0.28)*(2)*t + 6.5;
yt_prime = (0.18)*(2)*t - 8.5;

% Length of the position vector
rt = sqrt(xt.^2 + yt.^2);

% Length of the velocity vector
rt_prime = abs(sqrt(xt_prime.^2 + yt_prime.^2)); % (m/s)
rt_prime = rt_prime * 2.23693629; % convert to mph

% Angle from the x-axis
theta = atan(yt./xt); % answer in radians!
theta = theta*(180/pi); % convert to degrees

% ==================================================
%   Graph everything
% ==================================================

% First plot
subplot(2,2,1);
plot(xt,yt,'-*m');
title('Position of the Squirrel');
legend('Position','Location','Best');
xlabel('x (m)');
ylabel('y (m)');

% Second plot
subplot(2,2,2);
plot(t,theta,'-dg');
title('Angle of the Position Vector');
legend('Theta','Location','Best');
xlabel('Time (s)');
ylabel('Angle (degrees)');

% Third plot
subplot(2,2,3);
plot(t,rt,'-ob');
title('Length of the Position Vector');
legend('Distance','Location','Best')
xlabel('Time (s)');
ylabel('Distance (m)');

% Fourth plot
subplot(2,2,4);
plot(t,rt_prime,'-^r');
title('Length of the Velocity Vector');
legend('Velocity (mph)','Location','North')
xlabel('Time (s)');
ylabel('Velocity (mph)');


