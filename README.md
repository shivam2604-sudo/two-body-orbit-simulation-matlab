
# Two-Body Orbital Dynamics Simulation in MATLAB

## Analytical Characterization and Numerical Propagation of LEO and GEO Satellites

A MATLAB project that characterizes circular Earth orbits analytically and propagates satellite motion numerically.

The project compares a hand-written explicit Euler integrator with MATLAB's adaptive `ode45` solver and evaluates numerical accuracy using orbital radius and specific mechanical energy.

**Project status:** Stage 1 and Stage 2 complete. Stage 3 and Stage 4 are planned extensions.

---

## 1. Project Objective

The objective of this project is to understand how orbital mechanics equations translate into MATLAB simulations and how numerical integration methods affect orbit prediction.

The project investigates:

- Analytical orbital speed and period.
- Numerical propagation of satellite trajectories.
- Comparison of Euler and `ode45`.
- Numerical error and energy conservation.

---

## 2. Model and Assumptions

The initial model uses the classical two-body approximation.

- Earth is represented as a spherical body.
- The satellite is treated as a point mass.
- Only Earth's gravitational attraction is considered.
- The initial orbit is circular and planar.
- Atmospheric drag is neglected.
- Earth's oblateness is neglected.
- Solar radiation pressure and third-body effects are neglected.

These assumptions provide a simple model for understanding orbital mechanics and numerical integration.

---

## 3. Project Stages

### Stage 1 — Analytical Orbit Characterization

- Calculate circular orbital speed.
- Calculate orbital period.
- Calculate orbits per sidereal day.
- Validate the GEO orbital period.

### Stage 2 — Numerical Orbit Propagation

- Implement explicit Euler integration.
- Implement MATLAB's adaptive `ode45` solver.
- Compare numerical trajectories.
- Investigate radius and energy errors.
- Perform a time-step study.

### Stage 3 — Three-Dimensional Orbit and Ground Track

Planned extensions:

- Three-dimensional position and velocity.
- Orbital inclination.
- Earth rotation.
- Latitude and longitude ground tracks.

### Stage 4 — Perturbations and Coverage Analysis

Planned extensions:

- J2 perturbation.
- Sun-synchronous orbit inclination.
- Satellite swath and coverage.
- Revisit-time estimates.

---

## 4. Governing Equations

### 4.1 Circular-Orbit Properties

Orbital radius:

\[
r = R_E + h
\]

Circular orbital speed:

\[
v = \sqrt{\frac{\mu}{r}}
\]

Orbital period:

\[
T = 2\pi\sqrt{\frac{r^3}{\mu}}
\]

Orbits per sidereal day:

\[
N = \frac{T_{sidereal}}{T}
\]

### 4.2 Two-Body Equations of Motion

The two-dimensional state vector is:

\[
\mathbf{y} = [x,\ y,\ v_x,\ v_y]^T
\]

The acceleration is:

\[
\ddot{\mathbf{r}} = -\frac{\mu}{r^3}\mathbf{r}
\]

where:

\[
r = \sqrt{x^2+y^2}
\]

The first-order equations are:

\[
\frac{d}{dt}
\begin{bmatrix}
x\\
y\\
v_x\\
v_y
\end{bmatrix}
=
\begin{bmatrix}
v_x\\
v_y\\
-\mu x/r^3\\
-\mu y/r^3
\end{bmatrix}
\]

### 4.3 Specific Mechanical Energy

Specific orbital energy:

\[
\varepsilon =
\frac{1}{2}(v_x^2+v_y^2)-\frac{\mu}{r}
\]

For an ideal two-body orbit, specific mechanical energy should remain constant.

---

## 5. Constants and Units

All calculations use SI units internally.

| Quantity | Symbol | Value |
|---|---|---|
| Earth's equatorial radius | \(R_E\) | 6378.137 km |
| Earth's gravitational parameter | \(\mu\) | \(3.986004418\times10^{14}\) m³/s² |
| Sidereal day | \(T_{sidereal}\) | 23 h 56 min 4 s |

Results are displayed in:

- Kilometres (km)
- Kilometres per second (km/s)
- Minutes (min)
- Orbits per sidereal day

---

## 6. Analytical Results

The analytical model was evaluated for representative circular-orbit altitudes.

| Altitude (km) | Speed (km/s) | Period (min) | Orbits per sidereal day |
|---|---|---|---|
| 400 | 7.669 | 92.56 | 15.565 |
| 500 | 7.613 | 94.62 | 15.226 |
| 600 | 7.558 | 96.69 | 14.899 |
| 900 | 7.400 | 102.99 | 13.981 |
| 1000 | 7.350 | 105.12 | 13.703 |
| 35,786 (GEO) | 3.075 | 1436.07 | 1.000 |

### GEO Validation

- Calculated GEO period: approximately 1436.07 minutes.
- Reference sidereal day: approximately 1436.07 minutes.
- Reported percentage difference: approximately \(1.1\times10^{-5}\%\).

---

## 7. Numerical Propagation

The numerical experiment propagates a 500 km circular orbit for approximately one orbital period.

### 7.1 Explicit Euler Method

- Uses a fixed time step.
- Updates position and velocity using the current state.
- Introduces artificial energy gain.
- Causes the simulated orbit to spiral outward.

### 7.2 MATLAB ode45 Solver

- Uses an adaptive Runge–Kutta method.
- Adjusts the time step based on estimated numerical error.
- Provides more accurate orbital propagation for the selected tolerances.

Simulation settings:

- Relative tolerance: `1e-9`
- Absolute tolerance: `1e-6`

---

## 8. Numerical Comparison

| Method | Configuration | Radius change after one orbit |
|---|---|---|
| Explicit Euler | dt = 10 s | 920.0 km |
| Adaptive ode45 | RelTol = 1e-9, AbsTol = 1e-6 | 0.000004 km (about 4 mm) |

The comparison demonstrates that a trajectory can appear visually plausible while still accumulating significant numerical error.

---

## 9. Euler Time-Step Study

| Time step (s) | Radius growth (km) | Energy change (%) |
|---|---|---|
| 60 | 5200.4 | 35.99 |
| 10 | 920.0 | 10.96 |
| 1 | 95.1 | 1.35 |

### Key Findings

- Euler's error decreases as the time step becomes smaller.
- The Euler method introduces artificial energy gain.
- The satellite spirals outward instead of maintaining a circular orbit.
- `ode45` maintains the expected orbit much more accurately.
- Specific mechanical energy is a useful diagnostic for numerical accuracy.

---

## 10. Project Outputs

The MATLAB scripts generate:

- Analytical LEO and GEO comparison tables.
- Orbital speed and period plots.
- Euler orbital trajectory.
- Numerical energy-drift plot.
- Euler versus `ode45` trajectory comparison.
- Euler time-step study.
- GEO validation results.

Figures are stored in the `results/` folder.

---

## 11. MATLAB Project Structure

```text
two-body-orbit-simulation-matlab/
│
├── orbitalscript1.m
├── orbitalscript2.m
├── two_body_ode.m
├── README.md
├── LICENSE
│
└── results/
    ├── stage2_euler_orbit.png
    ├── stage2_energy_drift.png
    └── stage2_euler_vs_ode45.png
```

---

## 12. How to Run

### MATLAB Desktop

1. Download or clone the repository.
2. Open MATLAB.
3. Set the Current Folder to the project directory.
4. Run `orbitalscript1.m`.
5. Run `orbitalscript2.m`.
6. Review the numerical results and generated figures.

### MATLAB Online

1. Upload the project files to MATLAB Online.
2. Open the project directory.
3. Run `orbitalscript1.m` or `orbitalscript2.m`.
4. Review the generated tables and figures.

No additional MATLAB toolboxes are required.

---

## 13. Limitations and Future Work

The current model does not include:

- Atmospheric drag.
- Earth's non-spherical gravity field.
- Solar radiation pressure.
- Third-body gravitational effects.
- Real satellite tracking data.

Future improvements will include three-dimensional inclined orbits, ground-track analysis, J2 perturbation, and satellite coverage studies.

---

## 14. License

This project is released under the MIT License.

See the `LICENSE` file for details.
