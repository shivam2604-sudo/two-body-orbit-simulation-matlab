🛰️ Two-Body Orbital Dynamics Simulation
Analytical characterization and numerical propagation of LEO and GEO satellites in MATLAB
MATLAB compatibleTwo-body gravity modelProject statusMIT License

A compact MATLAB study of orbital mechanics, numerical integration, and solver accuracy.

Project at a glance
This project begins with the ideal two-body model of a satellite orbiting Earth. It first calculates circular-orbit properties analytically, then propagates the same orbit numerically using a hand-written explicit Euler integrator and MATLAB's adaptive ode45 solver.

The central engineering question is:

How does the choice of numerical integrator affect the physical accuracy of an orbital simulation?

Two-body orbital dynamics overview
Why this project matters
A trajectory can look visually reasonable while its radius and energy are already drifting. This project therefore evaluates the simulation using physical and numerical diagnostics—not just an orbit plot.

What is investigated	How it is evaluated
Circular LEO and GEO behaviour	Orbital speed, period, and revolutions per sidereal day
Numerical propagation	Position and velocity integration
Solver accuracy	Radius change after one orbit
Physical consistency	Specific mechanical-energy drift
Method sensitivity	Fixed-step Euler versus adaptive ode45
Main results
The analytical model was evaluated for representative circular-orbit altitudes.

Orbit altitude	Speed	Period	Revolutions per sidereal day
400 km	7.669 km/s	92.56 min	15.565
500 km	7.613 km/s	94.62 min	15.226
600 km	7.558 km/s	96.69 min	14.899
900 km	7.400 km/s	102.99 min	13.981
1,000 km	7.350 km/s	105.12 min	13.703
35,786 km — GEO	3.075 km/s	1,436.07 min	1.000
Solver comparison for a 500 km orbit
Method	Configuration	Radius change after one orbit
Explicit Euler	Fixed step, Δt = 10 s	920.0 km
ode45	RelTol = 1e-9, AbsTol = 1e-6	0.000004 km ≈ 4 mm
Interpretation
Euler: introduces artificial energy gain, causing the simulated orbit to spiral outward.
ode45: adapts its step size to control local truncation error and maintains the expected orbit much more accurately.
Key lesson: numerical accuracy should be assessed with radius and energy diagnostics, not only visual trajectory similarity.
Reproducibility note: rerun the Euler time-step study before quoting its exact numerical table. The reported values should be checked for monotonic convergence as the time step is reduced.

Model
Assumptions
The initial model intentionally uses a simplified two-body representation:

Earth is spherical.
The satellite is a point mass.
Only Earth's central gravitational attraction is included.
Initial test cases are circular orbits.
Atmospheric drag is neglected.
Earth's oblateness is neglected.
Solar radiation pressure and third-body gravity are neglected.
Satellite attitude and mass variation are not modelled.
These assumptions make the equations transparent and provide a controlled environment for comparing integration methods.

Circular-orbit equations
The orbital radius is measured from Earth's centre:

r = R_E + h
v = sqrt(mu / r)
T = 2*pi*sqrt(r^3 / mu)
N = T_sidereal / T
Numerical state model
The two-dimensional state vector is:

y = [x, y, vx, vy]^T
The two-body acceleration is:

a = -mu*r_vec / |r_vec|^3
The specific mechanical energy used for validation is:

epsilon = 0.5*(vx^2 + vy^2) - mu/|r_vec|
For an ideal two-body orbit, epsilon should remain constant.

Constants
Quantity	Value
Earth equatorial radius	R_E = 6378.137 km
Earth gravitational parameter	mu = 3.986004418e14 m^3/s^2
Sidereal day	23 h 56 min 4 s
Internal unit system	SI units
Simulation workflow
mermaid






Define Earth constants

Calculate circular-orbit properties

Create 500 km initial state

Propagate with explicit Euler

Propagate with ode45

Compare radius and energy

Interpret numerical accuracy

Project stages
✅ Stage 1 — Analytical orbit characterization
Calculate circular speed and orbital period.
Compare representative LEO altitudes with GEO.
Calculate revolutions per sidereal day.
Validate the GEO period against one sidereal day.
✅ Stage 2 — Numerical orbit propagation
Implement an explicit Euler integrator from first principles.
Propagate a 500 km circular orbit for one revolution.
Use MATLAB's adaptive ode45 solver as a higher-accuracy comparison.
Plot trajectories and numerical energy drift.
Study sensitivity to Euler time step.
🔄 Stage 3 — Three-dimensional orbit and ground track
Planned additions:

Three-dimensional position and velocity states.
Orbital inclination and right ascension of the ascending node.
Earth rotation.
Latitude/longitude ground-track plots.
🔄 Stage 4 — Perturbations and coverage
Planned additions:

J2 perturbation from Earth's oblateness.
Sun-synchronous-orbit inclination calculation.
Satellite swath and coverage geometry.
Revisit-time estimates.
Perturbed-versus-unperturbed trajectory comparison.
Repository structure
two-body-orbit-simulation-matlab/
├── orbit_stage1.m                 # Analytical orbit calculations
├── orbit_stage2.m                 # Euler and ode45 comparison
├── two_body_ode.m                 # Two-body first-order ODE function
├── results/
│   ├── orbit_dynamics_overview.png
│   ├── stage2_euler_orbit.png
│   ├── stage2_energy_drift.png
│   └── stage2_euler_vs_ode45.png
├── README.md
└── LICENSE
Quick start
MATLAB Desktop
% 1. Open MATLAB and set the Current Folder to this repository.
% 2. Run the analytical characterization:
orbit_stage1

% 3. Run the numerical propagation comparison:
orbit_stage2
The scripts print the analytical results and numerical comparisons in the Command Window and save figures in the results/ folder.

MATLAB Online
Upload the repository to MATLAB Online.
Open the project directory.
Run orbit_stage1.m.
Run orbit_stage2.m.
Review the generated figures in results/.
No additional MATLAB toolbox is required beyond the standard environment containing ode45.

Interview-ready explanation
I developed a MATLAB two-body orbital-dynamics simulator to study LEO and GEO satellite motion. I first calculated circular-orbit speed, period, and revolutions per sidereal day analytically, then validated the GEO period against one sidereal day. Next, I implemented a fixed-step explicit Euler integrator and compared it with MATLAB's adaptive ode45 solver. The main result was that Euler introduced artificial energy gain and caused the orbit to spiral outward, while ode45 maintained the expected orbit with a much smaller radius error. I used radius change and specific mechanical energy as numerical-quality metrics. The current model is intentionally idealized, and the planned extensions are three-dimensional inclined orbits, rotating-Earth ground tracks, J2 perturbation, and satellite coverage analysis.

Technical points to emphasize
I derived the two-body state equations and implemented the acceleration model explicitly.
I used SI units internally and converted units only for presentation.
I validated the GEO period against a sidereal day.
I compared a first-order fixed-step method with an adaptive Runge–Kutta solver.
I used conserved specific energy as a physics-based validation metric.
I identified the physical meaning of numerical error: artificial energy gain and outward spiralling.
Limitations
This is an educational two-body model. It does not yet include atmospheric drag, Earth's non-spherical gravity field, solar radiation pressure, third-body effects, launch-injection errors, real tracking data, or full coordinate-frame transformations.

These effects are intentionally deferred so that the basic equations and numerical-method behaviour can be understood first.

License
This project is released under the MIT License [blocked].

Built to connect orbital mechanics theory with practical MATLAB simulation.
