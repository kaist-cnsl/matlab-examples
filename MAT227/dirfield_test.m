% the ODE to plot
f = @(t,y) t^3-y^3;

% direction field, t=[0,4] x=[0,3]
dirfield(f,0:0.2:4,0:0.2:3)

% plot a range of solution curves
hold on
for y0=-3:0.2:3 
  [ts,ys] = ode45(f,[0,4],y0);
  plot(ts,ys,'LineWidth',2)
end

% plot the solution from IVP: t(2.5) = 2
[ts,ys] = ode45(f,[2.5,4],2);
plot(ts,ys,'m.','LineWidth', 4)
plot(2.5,2,'mo', 'MarkerSize', 14)

% make note of the point
t=text(2.55,1.95,'x(2.5) = 2', 'Color', 'm', 'BackgroundColor', 'w', 'fontsize', 14);
set(t,'Interpreter','Latex');

% display the diff eq
t=text(0.4,2.2,'$\frac{dx}{dt}=t^3-x^3$', 'BackgroundColor', 'w', 'fontsize', 30);
set(t,'Interpreter','Latex');

% STUFF
text(2,0,'made with MATLAB by Brian D. Wendt', 'BackgroundColor', 'w', 'fontsize', 14);
xlabel('Time (t)', 'fontsize', 18);
ylabel('Position (x)', 'fontsize', 18);
title('Direction Field with Solutions (1.3 #8)', 'fontsize', 22);

hold off
