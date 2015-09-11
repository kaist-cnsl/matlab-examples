% the ODE to plot (y=v)
f = @(t,y) 9.8-((5*y)/100);

% direction field
tmax = 80;
vmax = 350;
dirfield(f, 0:2:tmax, 0:10:vmax)

% plot a range of solution curves
hold on
vi = 50;
vf = 350;
vstep = 50;
for y0=vi:vstep:vf
  [ts,ys] = ode45(f,[0,tmax],y0);
  plot(ts,ys,'LineWidth',2)
end

% plot the solution from IVP: v(0) = 10 m/s
v0 = 10
t0 = 0
[ts,ys] = ode45(f,[t0,tmax],v0);
plot(ts,ys,'m-','LineWidth', 4)
plot(t0,v0,'mo', 'MarkerSize', 14)

% display the diff eq
t=text(tmax-20,vmax-20,'$\frac{dv}{dt}=9.8-\frac{5v}{100}$', 'BackgroundColor', 'w', 'fontsize', 30);
set(t,'Interpreter','Latex');

% STUFF
text(tmax-20,0,'made with MATLAB by Brian D. Wendt', 'BackgroundColor', 'w', 'fontsize', 14);
xlabel('Time (s)', 'fontsize', 18);
ylabel('Velocity (m/s)', 'fontsize', 18);
title('Direction Field: Freefall (2.2, #38)', 'fontsize', 22);

hold off
