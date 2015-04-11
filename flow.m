%Matlab script to solve a laminar flow
%in a duct problem

%Constants
inVel = 0.003; % Inlet Velocity (m/s)
fluidVisc = 1e-5; % Fluid's Viscoisity (Pa.s)
fluidDen = 1.3; %Fluid's Density (kg/m^3)

MAX_RESID = 1e-5; %uhh. residual units, yeah...
deltaTime = 1.5; %seconds?
%Kinematic Viscosity
fluidKinVisc = fluidVisc/fluidDen;

%Problem dimensions
ductLen=5; %m
ductWidth=1; %m

%grid resolution
gridPerLen = 50; % m^(-1)
gridDelta = 1/gridPerLen;
XVec = 0:gridDelta:ductLen-gridDelta;
YVec = 0:gridDelta:ductWidth-gridDelta; 

%Solution grid counts
gridXSize = ductLen*gridPerLen;
gridYSize = ductWidth*gridPerLen;

%Lay grid out with Y increasing down rows
%x decreasing down cols
%so subscripting becomes (y,x) (sorry)
velX= zeros(gridYSize,gridXSize);
velY= zeros(gridYSize,gridXSize);
newVelX= zeros(gridYSize,gridXSize);
newVelY= zeros(gridYSize,gridXSize);

%Set initial condition

for i =2:gridXSize-1
for j =2:gridYSize-1
velY(j,i)=0;
velX(j,i)=inVel;
end
end

%Set boundary condition on inlet
for i=2:gridYSize-1
velX(i,1)=inVel;
end

disp(velY(2:gridYSize-1,1));

%Arbitrarily set residual to prevent
%early loop termination
resid=1+MAX_RESID;

simTime=0;

while(deltaTime)
 count=0;
while(resid > MAX_RESID && count < 1e2)
 count = count +1;
for i=2:gridXSize-1
for j=2:gridYSize-1
newVelX(j,i) = velX(j,i) + deltaTime*( fluidKinVisc / (gridDelta.^2) * ...
(velX(j,i+1) + velX(j+1,i) - 4*velX(j,i) + velX(j-1,i) + ...
velX(j,i-1)) - 1/(2*gridDelta) *( velX(j,i) *(velX(j,i+1) - ...
velX(j,i-1)) + velY(j,i)*( velX(j+1,i) - velX(j,i+1))));

newVelY(j,i) = velY(j,i) + deltaTime*( fluidKinVisc / (gridDelta.^2) * ...
(velY(j,i+1) + velY(j+1,i) - 4*velY(j,i) + velY(j-1,i) + ...
velY(j,i-1)) - 1/(2*gridDelta) *( velY(j,i) *(velY(j,i+1) - ...
velY(j,i-1)) + velY(j,i)*( velY(j+1,i) - velY(j,i+1))));
end
end

%Copy the data into the front 
for i=2:gridXSize - 1
for j = 2:gridYSize-1
velX(j,i) = newVelX(j,i);
velY(j,i) = newVelY(j,i);
end
end

%Set free boundary condition on inlet (dv_x/dx) = dv_y/dx = 0
for i=1:gridYSize
velX(i,gridXSize)=velX(i,gridXSize-1);
velY(i,gridXSize)=velY(i,gridXSize-1);

    end

    %y velocity generating vent
    for i=floor(2/6*gridXSize):floor(4/6*gridXSize)
        velX(floor(gridYSize/2),i) = 0;
        velY(floor(gridYSize/2),i-1) = 0;
    end
    
%calculate residual for 
%conservation of mass
resid=0;
for i=2:gridXSize-1
for j=2:gridYSize-1
%mass continuity equation using central difference
%approx to differential
resid = resid + (velX(j,i+ 1)+velY(j+1,i) - ...
(velX(j,i-1) + velX(j-1,i)))^2;
end
end

resid = resid/(4*(gridDelta.^2))*1/(gridXSize*gridYSize);
fprintf('Time %5.3f \t log10Resid : %5.3f\n',simTime,log10(resid));

    

simTime = simTime + deltaTime;
end
mesh(XVec,YVec,velX)
deltaTime = input('\nnew delta time:');
end
%Plot the results
mesh(XVec,YVec,velX)
