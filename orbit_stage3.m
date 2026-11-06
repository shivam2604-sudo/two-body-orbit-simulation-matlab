clear; clc; close all
%% Case settings (the only lines you change)
alt=500*1000;            % satellite altitude (m)
inc_deg=97.4;            % inclination (deg)
dt=10;                   % time step (s)
n_orb=3;                 % number of orbits
%% Constants
mu=3.986004418e14;       % Earth's gravitational parameter GM (m^3/s^2)
Re=6378.137e3;           % Earth's equatorial radius (m)
Er=7.2921159e-5;         % Earth rotation rate (rad/s)
%% Orbit setup
rs=Re+alt;               % distance from Earth's centre (m)
T=2*pi*sqrt(rs^3/mu);    % orbital period (s)
n=sqrt(mu/rs^3);         % angular rate (rad/s)
inc=(inc_deg*pi)/180;    % inclination (rad)
t=0:dt:n_orb*T;          % time vector (s)
%% 3d position
u=n.*t;                  % satellite angle along its orbit (rad)
xp=rs*cos(u);            % x in the orbit plane (m)
yp=rs*sin(u);            % y in the orbit plane (m)
X=xp;                    % inertial x (m)
Y=yp*cos(inc);             % inertial y (m)
Z=yp*sin(inc);             % inertial z (m)
lat=asin(Z/rs)*180/pi;     % latitude (deg)
lon_gi=atan2(Y,X)*180/pi;  % inertial longitude (deg)
%% Latitude vs time
figure
plot(t/60,lat),
xlabel("Time (min)")
ylabel("Latitude (degree)")
title("Latitude (degree) vs Time (min)");
grid on
%% Earth rotation
lon_gr=lon_gi-(Er*t)*180/pi;   % ground longitude, unwrapped (deg)
lon=mod(lon_gr+180,360)-180;   % wrapped to -180..180 (deg)
jump=abs(diff(lon))>180;       % marks the wrap jumps
lon_p=lon;                     % copy for plotting
lon_p([false jump])=NaN;       % lift the pen at the jumps
%% Ground track
figure
plot(lon_p,lat);
hold on
plot(lon(1),lat(1),"go",MarkerSize=10);
plot(lon(end),lat(end),"ro",MarkerSize=10);
xlim([-180 180]);
ylim([-90 90]);
title(sprintf("Ground track, %d orbits (%d km, %.1f deg)",n_orb,alt/1000,inc_deg));
xlabel("Longitude (Degree)");
ylabel("Latitude (Degree)");
legend("Ground track","Start position","End position");
grid on
%% Checks
fprintf("max(lat) = %.2f deg, lon(end) = %.2f deg, wrap jumps = %d\n",max(lat),lon(end),sum(jump));