Two-Body Orbit Simulation in MATLAB
Analytical orbit characterization and numerical simulation of low Earth orbit (LEO) and geostationary Earth orbit (GEO) satellites using the two-body orbital dynamics model.

Project Overview
This project investigates the motion of satellites around Earth using MATLAB. The project is developed in three stages:

Stage 1: Analytical orbit characterization
Stage 2: Numerical propagation of the two-body equations of motion
Stage 3: Comparison of numerical and analytical results
The first version uses a simplified two-body model in which the satellite is affected only by Earth's gravitational attraction.

Model Assumptions
The initial model assumes that:

Earth is spherical.
The satellite is treated as a point mass.
Only Earth's gravity is included.
Atmospheric drag is neglected.
Earth's oblateness is neglected.
Third-body gravitational effects are neglected.
The first calculations describe circular orbits.
These assumptions make the project suitable for learning MATLAB and the fundamentals of orbital mechanics.

Stage 1: Analytical Orbit Characterization
Stage 1 calculates the theoretical circular-orbit speed, orbital period, and number of orbits per sidereal day for selected LEO and GEO altitudes.

Orbit Altitudes
Orbit category	Altitudes
LEO	400 km, 500 km, 600 km, 900 km, and 1000 km
GEO	35,786 km
Equations
The orbital radius is measured from Earth's center:

[ r = R_E + h ]

The circular orbital speed is:

[ v = \sqrt{\frac{\mu}{r}} ]

The orbital period is:

[ T = 2\pi\sqrt{\frac{r^3}{\mu}} ]

The number of orbits per sidereal day is:

[ N = \frac{T_{sidereal}}{T} ]

where:

(r) is the orbital radius in metres;
(h) is the satellite altitude in metres;
(R_E = 6378.137) km is Earth's equatorial radius;
(\mu = 3.986004418 \times 10^{14}) m(^3)/s(^2) is Earth's gravitational parameter;
(T_{sidereal} = 23) h 56 min 4 s is the length of a sidereal day.
All calculations use SI units internally. Results are displayed in kilometres, kilometres per second, and minutes where appropriate.

Current Implementation
The current MATLAB script, orbitalscript1.m, performs the following tasks:

Defines Earth and orbit constants.
Calculates orbital radius for each selected altitude.
Calculates circular orbital speed.
Calculates orbital period.
Calculates the number of orbits per sidereal day.
Displays the results in a MATLAB table.
Compares the calculated GEO period with the sidereal day.
Produces LEO speed and period plots.
Produces GEO-inclusive comparison plots.
How to Run
MATLAB Desktop
Download or clone this repository.
Open MATLAB.
Set the Current Folder to the project folder.
Open orbitalscript1.m.
Click Run.
Review the numerical table, Command Window output, and generated figures.
MATLAB Online
Upload orbitalscript1.m to MATLAB Online.
Open the script.
Click Run.
Review the table and generated figures.
No external data files are required for Stage 1.

Outputs
The script generates:

A numerical results table containing orbit type, altitude, speed, period, and orbits per sidereal day.
A plot of LEO orbital speed versus altitude.
A plot of LEO orbital period versus altitude.
A GEO-inclusive orbital speed comparison plot using a logarithmic altitude axis.
A GEO-inclusive orbital period comparison plot.
A GEO period validation and percentage error in the MATLAB Command Window.
The calculated GEO period should be close to approximately 1436 minutes, which is consistent with one sidereal day.

Expected Observations
The results should demonstrate that:

Circular orbital speed decreases as altitude increases.
Orbital period increases as altitude increases.
LEO satellites complete several orbits during one sidereal day.
A GEO satellite has an orbital period close to one sidereal day.
The GEO validation error is small when the stated constants and altitude are used.
Project Roadmap
Completed
 Define the two-body orbital model.
 Calculate analytical circular-orbit speed.
 Calculate analytical orbital period.
 Calculate the number of orbits per sidereal day.
 Validate the GEO orbital period.
 Generate LEO and GEO comparison plots.
Planned
 Implement the two-body equations of motion.
 Use MATLAB ode45 for numerical orbit propagation.
 Plot two-dimensional LEO and GEO trajectories.
 Simulate an elliptical orbit by changing the initial velocity.
 Calculate numerical orbital period from the propagated trajectory.
 Compare numerical and analytical orbital periods.
 Compare numerical and analytical orbital speeds.
 Investigate numerical conservation of energy and angular momentum.
Limitations
This project is an educational two-body simulation. It does not currently model atmospheric drag, Earth's non-spherical gravity field, solar radiation pressure, third-body effects, launch injection errors, or real satellite tracking data.

Project Structure
two-body-orbit-simulation-matlab/
├── orbitalscript1.m
├── README.md
├── LICENSE
└── results/
    ├── results_table.png
    ├── leo_plots.png
    └── geo_plots.png
The results/ folder is optional and can be used to store exported figures and tables.

License
This project is licensed under the MIT License. See the LICENSE file for details.
