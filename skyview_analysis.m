%
% Brian D. Wendt
% MATLAB Final Project
% EGR-167 SP2015
% 
% "skyview_analysis.m"
%
% 28 April 2015
%
% Reads a file containing comma-delimited data exported from
% a Dynon Avionics "SkyView" integrated avionics system, and
% analyzes some common flight and engine parameters.
%
% SkyView Info:
%   http://www.thenewskyview.com/
%

% Clear the Command Window
clc;

% Create a "table" datatype from CSV sample data file
%  http://www.mathworks.com/help/matlab/ref/table.html
%  http://www.mathworks.com/help/matlab/ref/webread.html
if ~ exist('SkyView','var')
    % All of these "if NOT exist()" statements improve performance
    % *dramatically* once all the variables are set in the Workspace.
    SkyView = webread('http://media.aeropunk.com/assets/data/skyview-data.csv');
end

% (Uncomment to debug: display table headers and first 5 rows)
%SkyView(1:5,:)

% Grab some useful parameters out of the big SkyView table
if ~ exist('t','var')
    % Dynon system time (seconds since boot)
    t          = SkyView{:,{'SessionTime'}};
    
    % Flight parameters
    kias       = SkyView{:,{'IndicatedAirspeed_knots_'}};
    ktas       = SkyView{:,{'TrueAirspeed_knots_'}};
    altitude   = SkyView{:,{'PressureAltitude_ft_'}};
    pitch      = SkyView{:,{'Pitch_deg_'}};
    roll       = SkyView{:,{'Roll_deg_'}};
    heading    = SkyView{:,{'MagneticHeading_deg_'}};
    turn_rate  = SkyView{:,{'TurnRate_deg_s_'}};
    lateral_g  = SkyView{:,{'LateralAccel_g_'}};
    vertical_g = SkyView{:,{'VerticalAccel_g_'}};
    climb_rate = SkyView{:,{'VerticalSpeed_ft_min_'}};
    
    % GPS data
    latitude   = SkyView{:,{'Latitude_deg_'}};
    longitude  = SkyView{:,{'Longitude_deg_'}};
    elevation  = SkyView{:,{'GPSAltitude_feet_'}};
    gps_time   = SkyView{:,{'GPSDate_Time'}};
    
    % Engine parameters
    oil_press  = SkyView{:,{'OilPressure_PSI_'}};
    oil_temp   = SkyView{:,{'OilTemp_degC_'}}; 
    mp_inHg    = SkyView{:,{'ManifoldPressure_inHg_'}};
    fuel_gph   = SkyView{:,{'FuelFlow1_gal_hr_'}};
    fuel_press = SkyView{:,{'FuelPressure_PSI_'}};
    
    % Engine CHTs (cylinder head temps)
    cht1       = SkyView{:,{'CHT1_degC_'}};
    cht2       = SkyView{:,{'CHT2_degC_'}};
    cht3       = SkyView{:,{'CHT3_degC_'}};
    cht4       = SkyView{:,{'CHT4_degC_'}};
    
    % Engine EGTs (exhaust gas temps)
    egt1       = SkyView{:,{'EGT1_degC_'}};
    egt2       = SkyView{:,{'EGT2_degC_'}};
    egt3       = SkyView{:,{'EGT3_degC_'}};
    egt4       = SkyView{:,{'EGT4_degC_'}};
end

% BIG Data requires BIG Plots
fontsize = 22;
linewidth = 5;
fullscreen = get(groot,'ScreenSize');
if fullscreen(4) >= 900
    fullscreen = [1 1 1280 900];
end

% ====================================================================== %

% Figure 1: "Manifold Pressure & CHTs"
figure('Name','Manifold Pressure & CHTs','Position',fullscreen);

% Plot two datasets with two different Y-axes
[ax,p1,p2] = plotyy([t,t,t,t],[cht1,cht2,cht3,cht4], t,mp_inHg);

% (Uncomment to debug: help with RBG colors in MATLAB)
%get(gca,'ColorOrder')

set(p1,...
    'linewidth', linewidth);
set(p2,...
    'linewidth', linewidth);
set(ax(1),...
    'xlim', [0 2200],...
    'ylim', [0 210],...
    'fontsize', fontsize,...
    'YColor', [0.8500 0.3250 0.0980]);
set(ax(2),...
    'xlim', [0 2200],...
    'ylim', [0 50],...
    'fontsize', fontsize);
grid(ax(1),'on');

title('Engine Intake Manifold Pressure & Cylinder Head Temperature');
xlabel(ax(1),'SkyView System Time (sec)');
ylabel(ax(1),'Cylinder Head Temps (ºC)'); % left y-axis
ylabel(ax(2),'Manifold Pressure (in. Hg)'); % right y-axis
legend(' CHT #1',' CHT #2',' CHT #3',' CHT #4',' Manifold Pressure');

% ====================================================================== %

% Figure 2: "Altitude & Rate of Climb"
figure('Name','Altitude & Rate of Climb','Position',fullscreen);
[ax,p1,p2] = plotyy(t,altitude, t,climb_rate);

set(p1,...
    'linewidth', linewidth);
set(p2,...
    'linewidth', linewidth);
set(ax(1),...
    'xlim', [0 2200],...
    'ylim', [1500 5000],...
    'fontsize', fontsize);
set(ax(2),...
    'xlim', [0 2200],...
    'ylim', [-2200 6000],...
    'fontsize', fontsize);
grid(ax(1),'on');

title('Altitude & Rate of Climb');
xlabel(ax(1),'SkyView System Time (sec)');
ylabel(ax(1),'Altitude (ft MSL)'); % left y-axis
ylabel(ax(2),'Rate of Climb (ft/min)'); % right y-axis
legend(' Altitude',' Climb Rate');

% ====================================================================== %

% Figure 3: "Altitude & Vertical Acceleration (g)"
figure('Name','Altitude & Vertical Acceleration (g)','Position',fullscreen);
[ax,p1,p2] = plotyy(t,altitude, t,vertical_g);

set(p1,...
    'linewidth', linewidth);
set(p2,...
    'linewidth', 3);
set(ax(1),...
    'xlim', [0 2200],...
    'ylim', [1500 5000],...
    'fontsize', fontsize);
set(ax(2),...
    'xlim', [0 2200],...
    'ylim', [-1 5],...
    'fontsize', fontsize);
grid(ax(1),'on');

title('Altitude & Vertical Acceleration (g)');
xlabel(ax(1),'SkyView System Time (sec)');
ylabel(ax(1),'Altitude (ft MSL)'); % left y-axis
ylabel(ax(2),'Vertical Accel. (g)'); % right y-axis
legend(' Altitude',' Accel. (g)');

% ====================================================================== %

% Figure 4: "Pitch & Roll"
figure('Name','Pitch & Roll','Position',fullscreen);
[ax,p1,p2] = plotyy(t,pitch, t,roll);

p1_color = [0.4940 0.1840 0.5560];
p2_color = [0.6350 0.0780 0.1840];

set(p1,...
    'linewidth', linewidth,...
    'color', p1_color);
set(p2,...
    'linewidth', linewidth,...
    'color', p2_color);
set(ax(1),...
    'xlim', [0 2200],...
    'ylim', [-50 20],...
    'fontsize', fontsize,...
    'YColor', p1_color);
set(ax(2),...
    'xlim', [0 2200],...
    'ylim', [-70 100],...
    'fontsize', fontsize,...
    'YColor', p2_color);
grid(ax(2),'on');

title('Pitch & Roll');
xlabel(ax(1),'SkyView System Time (sec)');
ylabel(ax(1),'Pitch (degrees)'); % left y-axis
ylabel(ax(2),'Roll (degrees)'); % right y-axis
legend(' Pitch',' Roll');

% ====================================================================== %

% OK that was fun, now can we DRAW A MAP?
% Not without MATLAB's proprietary "Mapping Toolbox" apparently.
% -- Awesome. --
% But what we CAN do is export our lat/lon data as a CSV file
% and upload that (manually) to http://www.gpsvisualizer.com/
if ~ exist('GPS_data','var')
    GPS_data = table(latitude,longitude);
    writetable(GPS_data,'skyview-map.csv');
end

% Now we have an interactive online map of the GPS data.
%web('http://media.aeropunk.com/assets/data/skyview-map.html');

