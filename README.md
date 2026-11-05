Two-Body Orbital Dynamics Simulation in MATLAB
Analytical Characterization and Numerical Propagation of LEO and GEO Satellites
A MATLAB project that models circular Earth orbits analytically and propagates satellite motion numerically. The project compares a hand-written explicit Euler integrator with MATLAB's adaptive ode45 solver and evaluates numerical accuracy using orbital radius and specific mechanical energy.

Project status: Stages 1 and 2 are complete. Stages 3 and 4 are planned extensions covering three-dimensional motion, ground tracks, inclination, J2 perturbation, and coverage analysis.

1. Project Objective
The objective of this project is to understand how orbital mechanics equations translate into MATLAB simulations and how numerical integration methods affect the quality of an orbit prediction.

The project answers three practical questions:

What are the expected speed and period of circular LEO and GEO orbits?
How accurately can a satellite orbit be propagated numerically?
How does a simple Euler integrator compare with MATLAB's adaptive ode45 solver?
The project is intentionally designed as an educational orbital-dynamics model before introducing higher-fidelity effects such as atmospheric drag and Earth's oblateness.

2. Model and Assumptions
The initial model uses the classical two-body approximation:

Earth is represented as a spherical body.
The satellite is treated as a point mass.
The satellite experiences only Earth's central gravitational attraction.
The orbit is initially circular.
Atmospheric drag is neglected.
Earth's oblateness is neglected.
Solar radiation pressure and third-body effects are neglected.
Satellite attitude and mass variation are not modelled.
These assumptions produce a simple, transparent model that is useful for validating the equations, units, numerical methods, and MATLAB implementation.

3. Project Stages
Stage 1 — Analytical orbit characterization
Calculates the theoretical circular-orbit speed, period, and number of revolutions per sidereal day for representative LEO and GEO altitudes.

Stage 2 — Numerical orbit propagation
Propagates a 500 km circular orbit using:

A fixed-step explicit Euler method written manually.
MATLAB's adaptive ode45 solver.
The two methods are compared using trajectory, radius, and energy behaviour.

Stage 3 — Three-dimensional orbit and ground track
Planned extension that will add:

Three-dimensional position and velocity states.
Orbital inclination and right ascension of the ascending node.
Earth rotation.
Latitude/longitude ground-track plots.
Stage 4 — Perturbations and mission-level analysis
Planned extension that will add:

The J2 perturbation caused by Earth's oblateness.
Sun-synchronous orbit inclination calculations.
Satellite swath and coverage analysis.
Revisit-time estimates.
Comparison of perturbed and ideal two-body trajectories.
4. Governing Equations
4.1 Circular-orbit properties
The orbital radius is measured from Earth's centre:

[ r = R_E + h ]

where (R_E) is Earth's equatorial radius and (h) is altitude above Earth's surface.

The circular orbital speed is:

[ v = \sqrt{\frac{\mu}{r}} ]

The orbital period is:

[ T = 2\pi\sqrt{\frac{r^3}{\mu}} ]

The number of orbits per sidereal day is:

[ N = \frac{T_{sidereal}}{T} ]

4.2 Two-body equations of motion
For the two-dimensional numerical model, the state vector is:

[ \mathbf{y} = [x,\ y,\ v_x,\ v_y]^T ]

The acceleration is:

[ \ddot{\mathbf{r}} = -\frac{\mu}{r^3}\mathbf{r} ]

where:

[ r = \sqrt{x^2+y^2} ]

In first-order form, the differential equation supplied to ode45 is:

[ \frac{d}{dt} \begin{bmatrix} x \ y \ v_x \ v_y \end{bmatrix}
\begin{bmatrix} v_x \ v_y \ -\mu x/r^3 \ -\mu y/r^3 \end{bmatrix} ]

4.3 Specific mechanical energy
The specific orbital energy is used as a numerical diagnostic:

[ \varepsilon = \frac{1}{2}(v_x^2+v_y^2)-\frac{\mu}{r} ]

For an ideal two-body orbit, specific mechanical energy should remain constant. A systematic change in energy indicates numerical error or a physical perturbation.

5. Constants and Units
All calculations use SI units internally.

Quantity	Symbol	Value
Earth's equatorial radius	(R_E)	6378.137 km
Earth's gravitational parameter	(\mu)	(3.986004418\times10^{14}) m³/s²
Sidereal day	(T_{sidereal})	23 h 56 min 4 s
Results are converted for display into kilometres, kilometres per second, minutes, and revolutions per sidereal day.

6. Analytical Results
The analytical model was evaluated for representative circular-orbit altitudes.

Altitude (km)	Speed (km/s)	Period (min)	Orbits per sidereal day
400	7.669	92.56	15.565
500	7.613	94.62	15.226
600	7.558	96.69	14.899
900	7.400	102.99	13.981
1000	7.350	105.12	13.703
35,786	3.075	1436.07	1.000
GEO validation
The calculated GEO period is approximately 1436.07 minutes, matching one sidereal day. The reported percentage difference is approximately (1.1\times10^{-5}%), validating the equations, constants, and unit conversions used in Stage 1.

7. Numerical Propagation
The numerical experiment propagates a 500 km circular orbit for approximately one orbital period.

Euler method
The explicit Euler method uses a fixed time step and updates position and velocity directly from the current state. It is easy to implement and useful for demonstrating numerical integration, but it is not well suited to long-duration orbital propagation because it does not preserve orbital energy.

The observed behaviour is an artificial increase in specific orbital energy. As a result, the simulated satellite spirals outward and its orbital radius grows with time.

ode45 method
MATLAB's ode45 uses an adaptive Runge–Kutta method. It automatically changes the time step in response to the estimated local truncation error.

The simulation used:

Relative tolerance: 1e-9
Absolute tolerance: 1e-6
This produced a radius change of approximately 0.000004 km, or about 4 mm, after one orbit in the reported experiment.

8. Numerical Comparison
Method	Configuration	Radius change after one orbit
Explicit Euler	(\Delta t=10) s	920.0 km
Adaptive ode45	RelTol = 1e-9, AbsTol = 1e-6	0.000004 km, approximately 4 mm
The comparison demonstrates that a method can produce a visually plausible orbit while still accumulating significant physical error. Radius and energy diagnostics are therefore more informative than a trajectory plot alone.

Important validation note
Before presenting the Euler time-step table in an interview, rerun the MATLAB script and verify the values. The currently reported values are not monotonic with time step: a smaller time step should normally reduce the error for this experiment. This may indicate a table-formatting issue, a comparison against different reference states, or a bug in the time-step-study implementation.

9. Key Findings
Circular-orbit speed decreases as altitude increases.
Orbital period increases as altitude increases.
A GEO orbit has a period equal to one sidereal day by design.
Explicit Euler introduces artificial energy gain in the circular-orbit simulation.
The resulting Euler trajectory spirals outward.
ode45 maintains the expected orbit much more accurately for the selected tolerances.
Specific mechanical energy is a strong diagnostic for judging propagation quality.
Fixed-step Euler is valuable for learning and benchmarking, but it is not an appropriate production propagator for accurate long-duration orbit prediction.
10. MATLAB Project Structure
two-body-orbit-simulation-matlab/
├── orbit_stage1.m          % Analytical orbital calculations
├── orbit_stage2.m          % Euler and ode45 propagation comparison
├── two_body_ode.m          % First-order two-body equations of motion
├── README.md
├── LICENSE
└── results/
    ├── stage2_euler_orbit.png
    ├── stage2_energy_drift.png
    └── stage2_euler_vs_ode45.png
Main outputs
The scripts generate:

Analytical LEO/GEO comparison tables.
Orbital speed and period plots.
Euler trajectory plots.
Euler-versus-ode45 trajectory comparisons.
Numerical energy-drift plots.
GEO validation results.
Euler time-step-study results.
11. How to Run
MATLAB Desktop
Clone or download the repository.
Open MATLAB.
Set the Current Folder to the project directory.
Run orbit_stage1.m.
Run orbit_stage2.m.
Review the command-window results and figures in the results/ folder.
MATLAB Online
Upload the project files to MATLAB Online.
Open the project directory.
Run orbit_stage1.m or orbit_stage2.m.
Review the generated tables and figures.
No additional MATLAB toolboxes are required beyond the standard MATLAB environment containing ode45.

12. Limitations and Future Work
The current project is an educational two-body model. It does not yet include:

Atmospheric drag.
Earth's non-spherical gravity field.
Solar radiation pressure.
Third-body gravitational effects.
Launch-injection errors.
Real satellite tracking data.
Coordinate-frame transformations beyond the planned ground-track model.
The next development step is to add three-dimensional inclined orbits and transform inertial coordinates into Earth-fixed latitude and longitude. The later J2 model will provide a more realistic representation of nodal precession and enable a sun-synchronous-orbit study.

License
This project is released under the MIT License. See LICENSE for details.
