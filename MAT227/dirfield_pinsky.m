% the ODE to plot
f = @(t,y) -sin(t) - 0.1*y;

% direction field, t=[0,4] x=[0,3]
dirfield(f, -10:1:10, -10:1:10)

% plot a range of solution curves
hold on
for y0=-10:.5:10 
  [ts,ys] = ode45(f,[-10,10],y0);
  plot(ts,ys,'LineWidth',2)
end

hold off

%
# Non linear pendulum
dx/dt = y
dy/dt = -b/M*y-g/L*sin(x)

# Initial Conditions
x(0)=0
y(0)=6
Ei=M*g*L*(1-cos(0))+.5*M*(L*6)^2

# Energy
Ep=M*g*L*(1-cos(x))
Ec = .5*M*(L*y)^2
Et = Ep + Ec
aux AND. P. = Ep
aux AND. C. = Ec
aux AND. T. = Et

# Parameters
param M=10,b=4,g=9.8,L=4
param scale=0.0083333
@ bounds = 50000
@ xplot = x, yplot = y
@ xlo = -10, xhi = 10, ylo = -6, yhi = 6
@ DT=0.025
done