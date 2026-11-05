Two-Body Orbital Dynamics Simulation and Orbit Characterization of LEO and GEO Satellites in MATLAB\
A MATLAB project that characterises circular Earth orbits analytically and then propagates them numerically, comparing a hand-written explicit Euler integrator against MATLAB's adaptive \`ode45\` solver.\
Status: Stage 1 and Stage 2 complete. Stage 3 (ground track) and Stage 4 (inclination, J2, coverage) in progress.\
Contents\
File	Purpose\
\`orbit_stage1.m\`	Analytical orbital speed, period and orbits per day for LEO to GEO, with validation\
\`orbit_stage2.m\`	Euler and ODE45 orbit propagation, error and energy analysis, time-step study\
\`two_body_ode.m\`	Equations of motion in the form required by \`ode45\`\
\`results/\`	Figures produced by the scripts\
Run \`orbit_stage1.m\` or \`orbit_stage2.m\` directly. Keep \`two_body_ode.m\` in the same folder. Tested workflow: MATLAB Online, no toolboxes required.\
Theory\
For a circular two-body orbit of radius r = R\<sub>e\</sub> + altitude, gravity supplies the centripetal force:\
Orbital speed: v = sqrt(mu / r)\
Orbital period: T = 2 pi sqrt(r^3 / mu)\
where mu = GM = 3.986004418 x 10^14 m^3/s^2 and R\<sub>e\</sub> = 6378.137 km.\
For propagation, the satellite state [x, y, vx, vy] evolves under\
a = -mu r_vec / |r|^3\
and the specific orbital energy E = v^2/2 - mu/r should remain constant for an ideal circular orbit. Radius growth and energy drift are therefore used as error measures.\
Stage 1: analytical orbit characterisation\
Altitude (km)	Speed (km/s)	Period (min)	Orbits/day\
400	7.669	92.56	15.56\
500	7.613	94.62	15.22\
600	7.558	96.69	14.89\
900	7.400	102.99	13.98\
1000	7.350	105.12	13.70\
35786 (GEO)	3.075	1436.07	1.00\
Validation: the computed GEO period is compared with the sidereal day (23 h 56 min 4 s = 1436.07 min). The error is 1.1 x 10^-5 %, confirming the formulas, constants and unit handling.\
Stage 2: numerical propagation (500 km, one orbit)\
Euler propagation with dt = 10 s:\
![Euler orbit]\(results/stage2_euler_orbit.png)\
Specific energy should be constant but rises under Euler:\
![Energy drift]\(results/stage2_energy_drift.png)\
Euler against \`ode45\` (RelTol 1e-9, AbsTol 1e-6):\
![Euler vs ode45]\(results/stage2_euler_vs_ode45.png)\
Method	Radius growth after one orbit\
Euler, dt = 10 s	920.0 km (13.38 %)\
\`ode45\`	0.000004 km (about 4 mm)\
Time-step study (Euler)\
dt (s)	Radius growth (km)	Energy change (%)\
60	5200.4	35.99\
10	920.0	10.96\
1	95.1	1.35\
Findings\
Euler's error scales roughly linearly with dt, which is consistent with a first-order method. A tenfold reduction in dt (10 s to 1 s) reduced the radius error by about 9.7x and the energy error by about 8x.\
Each Euler step lands slightly outside the true circle, so the orbit gains energy and spirals outward. A larger orbit also has a longer period, so the satellite does not return to its starting point after one nominal period.\
Even with dt = 1 s (about 5,700 steps) Euler is still about 95 km off, whereas \`ode45\` is accurate to millimetres. Reducing the step size alone is an inefficient way to gain accuracy.\
Assumptions and limitations\
Two-body problem: Earth and satellite only\
Spherical Earth, point-mass gravity\
Circular, planar (2D) orbit in Stage 2\
No atmospheric drag, J2, solar radiation pressure or third-body effects\
One orbit simulated; long-duration drift is not studied\
Roadmap\
[x] Stage 1: analytical period and speed, validation\
[x] Stage 2: Euler and ODE45 propagation, energy and time-step study\
[ ] Stage 3: 3D orbit with inclination and ground track on a rotating Earth\
[ ] Stage 4: J2 perturbation, sun-synchronous inclination, swath and revisit analysis\
License\
MIT
