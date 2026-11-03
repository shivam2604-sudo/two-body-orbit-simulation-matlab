clear; clc; close all
%% Constants
mu=3.986004418e14;   % Earth's gravitational parameter GM (m^3/s^2)
Re=6378.137e3;       % Earth's equatorial radius (m)
%% Input
alt_kms=[400 500 600 900 1000 35786];   %altitude of LEO and GEO in km
alt=(alt_kms*1000);                     %altitude of LEO & GEO in m
r=Re+alt;
%% Calculations
v=sqrt(mu./r);             %circular orbital speed (m/s)
T=2*pi*sqrt(r.^3/mu);      %orbital period (s)
%% Display quantities
v_km=v/1000;               %orbital speed (km/s)
T_min=T/60;                %orbital period (min)
orbitS_per_day=1440./T_min;    %orbit per day
%% Validation and output
geo_expectedT = 23*60 + 56 + 4/60;                         %sidereal day (min)
Err_per=abs(T_min(end)-geo_expectedT)/geo_expectedT * 100;  %error (%)
fprintf('GEO period= %.2fmin,error = %.6f%%\n',T_min(end),Err_per);
%% Result table
fprintf('\nAlt(km)   Speed(km/s)   Period(min)   Orbits/day\n');
for i=1:length(alt_kms)
    fprintf('%7d, %11.3f, %13.2f, %12.2f\n',alt_kms(i), v_km(i), T_min(i), orbitS_per_day(i))
end
%% Plot for LEO
figure
subplot(2,1,1)
 plot(alt_kms(1:end-1),v_km(1:end-1),"-*")
xlabel Altitude(km)
ylabel Speed(km/s)
title("Orbital Speed vs Altitude(LEO)")
grid on

subplot(2,1,2)
plot(alt_kms(1:end-1),T_min(1:end-1),"-*")
xlabel Altitude(km)
ylabel Period(min)
title ("Orbital period vs Altitude(km)")
grid on
%% Plot for GEO
figure
subplot(2,1,1)
plot(alt_kms,v_km,"-*")
set(gca, 'XScale', 'log')
xlabel Altitude(km)
ylabel Speed(km/s)
title("Orbital Speed vs Altitude(GEO)")
grid on

subplot(2,1,2)
plot(alt_kms,T_min,"-*")
xlabel Altitude(km)
ylabel Period(min)
title ("Orbital period vs Altitude(km)")
grid on
