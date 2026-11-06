clear; clc; close all
%% Constants
mu=3.986004418e14;   % Earth's gravitational parameter GM (m^3/s^2)
Re=6378.137e3;       % Earth's equatorial radius (m)
%% Setup
alt=500*1000;         %Altitude of satellite(m)
rs=Re+alt;            %distance from Earth's center to satellite (m)
xs=rs;                %initial x-position (m)
ys=0;                 %initial y-position (m)
vx=0;                 %initial x-velocity (m/s)
vy=sqrt(mu./rs);      %initial y-velocity,circular orbit speed (m/s)
T=2*pi*sqrt(rs.^3/mu); %orbital period (s)
dt=10;                %time steps (s)
N=round(T/dt);         %number of steps to cover one orbit
%% Array
t=(0:dt:N*dt);
x=zeros(1,1+N);
y=zeros(1,1+N);
vxs=zeros(1,1+N);
vys=zeros(1,1+N);
x(1)=rs;
y(1)=ys;
vxs(1)=vx;
vys(1)=vy;
%% Euler loop
for i=1:N
    rad=sqrt(x(i)^2+y(i)^2);
    ax=-mu*x(i)/rad^3;
    ay=-mu*y(i)/rad^3;
    vxs(i+1)=vxs(i)+ax*dt;
    vys(i+1)=vys(i)+ay*dt;
    x(i+1)=x(i)+vxs(i)*dt;
    y(i+1)=y(i)+vys(i)*dt;
end
%% Orbit plot
figure
plot(x,y,"k")                    % satellite path
axis equal
hold on
th =linspace(0,2*pi,200);        % angles for a full circle (rad)
plot(Re*cos(th),Re*sin(th),"b")  % Earth, radius Re (m)
plot(x(1),y(1),"o",MarkerSize=10)              % start point
plot(x(end),y(end),"r x",MarkerSize=10,LineWidth=2)          % end point
xlabel ("x(m)")
ylabel ("y(m)")
title("Euler orbit propagation(500 km,dt=10 s)")
legend("Euler orbit","Earth","start point","end point")
grid on
%% Error check
rad_end=sqrt(x(end)^2+y(end)^2);                     % radius at last step (m)
radius_growthkm=(rad_end-rs)/1000;                   % radius growth after one orbit(km)
radius_growthper=((radius_growthkm*1000)/rs(1)*100); % radius growth(% of starting radius)
fprintf('Euler(dt=%d s):radius grew by %.1f km(%.2f%%)after one orbit\n',dt,radius_growthkm,radius_growthper);
%% Energy check
v_each=sqrt(vxs.^2+vys.^2);    %speed at every steps
r_each=sqrt(x.^2+y.^2);        %radius at each steps
E=(v_each.^2/2)-(mu./r_each);  %Energy at each steps(J/Kg)
figure
plot(t/60,E);
xlabel("Time (min)")
ylabel("Energy (J/Kg)")
title("Energy(J/Kg) vs Time(min)")
grid on
E_change_per=(E(end)-E(1))/abs(E(1))*100; %energy change after one orbit(%)
fprintf ('Euler Energy change by %.2f %% after one orbit\n',E_change_per);
%% ode45
s0=[xs;ys;vx;vy];                               % starting state(column)
tspan=[0 N*dt];                                 % simulate from 0 s to the end time(s)
opts=odeset('RelTol',1e-9,'AbsTol',1e-6);       % accuracy settings
[t_o,s_o]=ode45(@(t,s) two_body_ode(t,s,mu),tspan,s0,opts);
x_o = s_o(:,1);                                 % x from ode45(m)
y_o = s_o(:,2);                                  % y from ode45(m)
r_end_o=sqrt(x_o(end)^2+y_o(end)^2);      % ode45 radius at end(m)
Rgrowth_km_o=(r_end_o-rs)/1000;          % ode45 radius growth(Km)
Rgrowth_km_o_per=(Rgrowth_km_o*1000/rs(1)*100);
fprintf('ode45:Radius grew by %.6f km(%.2f%%) after one orbit.\n',Rgrowth_km_o,Rgrowth_km_o_per);
%% Comparsion plot
figure
plot(x,y,"r")             % Sattlite orbit as per Eluer
hold on
plot(x_o,y_o,"g",LineWidth=1.5);          % Sattlite orbit as per ode45
axis equal
hold on
th =linspace(0,2*pi,200);        % angles for a full circle (rad)
plot(Re*cos(th),Re*sin(th),"b")  % Earth, radius Re(m)
plot(x(1),y(1),"ko",markersize=8) % start point
axis equal
xlabel("x (m)")
ylabel("y (m)")
title("Euler vs ode45 (500 km)")
grid on
legend("Euler orbit","ode45 otbit","Earth","Start")

function ds=two_body_ode(t,s,mu)
rad= sqrt(s(1)^2 + s(2)^2); % distance from center(m)
ax=-mu*s(1)/rad^3;          % gravity acceleration,x (m/s^2)
ay=-mu*s(2)/rad^3;          % gravity acceleration,y (m/s^2)
ds=[s(3);s(4);ax;ay];       % rates of change of x,y,vx,vy
end
