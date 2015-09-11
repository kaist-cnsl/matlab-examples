%
% Brian D. Wendt
% Matlab Lab #2, Part 2
% EGR-167 SP2015
%

range = -pi:2*pi/100:pi;

f1 = sin(range.^2);
f2 = (sin(range)).^2;
f3 = cos(range.^2);
f4 = (cos(range)).^2;

g1 = tan(range.^2);
g2 = (tan(range)).^2;
g3 = tan(range.^2);
g4 = (tan(range)).^2;

subplot (1,4,1);
ylim ([-1,1]);
hold on;
plot (range, f1, 'r');
plot (range, g1, 'b');
title ('sine & tan of range squared');

subplot(1,4,2);
ylim ([0,1]);
hold on;
plot (range, f2, 'r');
plot (range, g2, 'b');
title('sine & tan of range, squared');

subplot(1,4,3);
ylim ([-1,1]);
hold on;
plot (range, f3, 'r');
plot (range, g3, 'b');
title('cosine & tan of range squared');

subplot(1,4,4);
ylim ([0,1]);
hold on;
plot(range, f4, 'r');
plot (range, g4, 'b');
title('cosine & tan of range, squared');