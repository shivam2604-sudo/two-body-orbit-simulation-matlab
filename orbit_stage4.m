clear; clc; close all
%% Constants
mu=3.986004418e14;   % Earth's gravitational parameter GM (m^3/s^2)
Re=6378.137e3;       % Earth's equatorial radius (m)
J2=1.08263e-3;     
%% Case setting
alt=500*1000;
rs=Re+alt;
n=sqrt(mu./rs^3);
%% Target rate
omega_sso=(2*pi)/(365.2422*86400);    % Required precession(rad/s)
omega_perday=omega_sso*180/pi*86400;  % precession per day (Degree/day)
fprintf('omega_sso = %.4e rad/s, %.4f deg/day\n',omega_sso,omega_perday);
%% Inclination
inc_deg = 97.4;
inc=97.4*pi/180;
%% J2 precession
omega_j2=-1.5*J2*(Re/rs)^2*n*cos(inc);    % J2 precession (rad/sec)
omega_j2_perday=omega_j2*180/pi*86400;    % J2 precession (deg/day)
fprintf('J2 precession=%.4e rad/s, %.4f deg/day\n',omega_j2,omega_j2_perday);
%% Sun-synchronous inclination
cos_inc_sso=-omega_sso./(1.5*J2*(Re/rs)^2*n);   % cos(inc) that gives the required precession
inc_sso_deg=acos(cos_inc_sso)*180/pi;          % inclination (deg)
fprintf('SSO inclination at %.1f km = %.2f deg\n',alt/1000,inc_sso_deg);
%% Sun-synchronous inclination vs Altitude
alt_in=(300:25:1000)*1000;
rs_in=Re+alt_in;
n_in=sqrt(mu./rs_in.^3);
cos_in=-omega_sso./(1.5*J2*(Re./rs_in).^2.*n_in);
inc_in=acos(cos_in)*180/pi;
figure
plot(alt_in/1000,inc_in,LineWidth=2);
title("Sun-synchronous inclination (Degree) vs Altitude (km)")
xlabel("Altitude (km)")
ylabel("Sun-synchronous inclination (Degree)")
grid on
hold on
plot(500, inc_sso_deg,"go", MarkerSize=10)
legend("SSO inclination","500 km case")
hold on
plot(592.5, 97.76, "rs", MarkerSize=10)
legend("SSO inclination","500 km case","Drishti (592.5 km)")
%% Ground track spacing
Er = 7.2921159e-5;   %Earth rotational speed
T=2*pi*sqrt(rs.^3/mu);       %orbital period (s)
shift_deg=Er*T*180/pi;
shift_km=shift_deg*pi/180*Re/1000;
orbit_perday=86400/T;
fprintf('Earth shift=%.2f(Deg),%2.f(km) orbit/day=%.2f\n',shift_deg,shift_km,orbit_perday);
%% Swath and revisit
circ_km=2*pi*Re/1000;   % Equator length (km)
swath_km = [10 30];     % Drishti: optical 10 km, SAR 30 km
circ_dayscover=circ_km./(orbit_perday.*swath_km); % Days required to cover the whole Equator
names={"Optical","SAR"};
for k=1:length(swath_km)
    fprintf('%s swath (%d) km = %.0f days\n',names{k},swath_km(k),circ_dayscover(k));
end


