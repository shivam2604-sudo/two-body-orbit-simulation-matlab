# Two-Body Orbit Simulation in MATLAB

Analytical orbit characterization and numerical simulation of Low Earth Orbit (LEO) and Geostationary Earth Orbit (GEO) satellites using the two-body orbital dynamics model.

## 1. Project Overview

This project investigates satellite motion around Earth using MATLAB.

The project is developed in three stages:

- **Stage 1:** Analytical orbit characterization.
- **Stage 2:** Numerical propagation of the two-body equations of motion.
- **Stage 3:** Comparison of numerical and analytical results.

The initial model considers a simplified two-body system in which the satellite is affected only by Earth's gravitational attraction.

## 2. Model Assumptions

The initial orbital model assumes:

- Earth is spherical.
- The satellite is treated as a point mass.
- Only Earth's gravitational attraction is considered.
- Atmospheric drag is neglected.
- Earth's oblateness is neglected.
- Third-body gravitational effects are neglected.
- Initial calculations consider circular orbits.

These assumptions make the project suitable for understanding MATLAB programming and the fundamentals of orbital mechanics.

## 3. Stage 1: Analytical Orbit Characterization

Stage 1 calculates the theoretical circular orbital speed, orbital period and number of orbits per sidereal day for selected LEO and GEO altitudes.

### 3.1 Orbit Altitudes

The following orbital altitudes are considered:

| Orbit Category | Altitude |
|---|---|
| LEO | 400 km |
| LEO | 500 km |
| LEO | 600 km |
| LEO | 900 km |
| LEO | 1000 km |
| GEO | 35,786 km |

### 3.2 Governing Equations

The orbital radius is measured from Earth's centre:

\[
r = R_E + h
\]

Circular orbital velocity:

\[
v = \sqrt{\frac{\mu}{r}}
\]

Orbital period:

\[
T = 2\pi\sqrt{\frac{r^3}{\mu}}
\]

Number of orbits per sidereal day:

\[
N = \frac{T_{sidereal}}{T}
\]

### 3.3 Constants Used

- Earth's equatorial radius:
  \(R_E = 6378.137\ km\)
- Earth's gravitational parameter:
  \(\mu = 3.986004418 \times 10^{14}\ m^3/s^2\)
- Sidereal day:
  \(T_{sidereal} = 23h\ 56m\ 4s\)

All calculations use SI units internally.

Results are displayed in:
- Kilometres (km)
- Kilometres per second (km/s)
- Minutes (min)
- Orbits per sidereal day

### 3.4 GEO Validation

The calculated GEO orbital period is compared with one sidereal day.

- Reference period: approximately 1436 minutes.
- Calculated GEO orbital period is checked against this reference.
- Percentage error is calculated and displayed.

## 4. Current Implementation

The current MATLAB script, `orbitalscript1.m`, performs the following tasks:

- Defines Earth and orbital constants.
- Calculates orbital radius for selected altitudes.
- Calculates circular orbital velocity.
- Calculates orbital period.
- Calculates the number of orbits per sidereal day.
- Displays numerical results in a MATLAB table.
- Validates the GEO orbital period against the sidereal day.
- Generates LEO orbital speed and period plots.
- Generates GEO-inclusive comparison plots.

## 5. Project Outputs

The MATLAB script generates:

- A numerical results table containing:
  - Orbit type
  - Altitude
  - Orbital speed
  - Orbital period
  - Orbits per sidereal day

- LEO orbital speed versus altitude plot.
- LEO orbital period versus altitude plot.
- GEO-inclusive orbital speed comparison plot.
- GEO-inclusive orbital period comparison plot.
- GEO validation results and percentage error in the MATLAB Command Window.

## 6. Expected Observations

The results should demonstrate that:

- Circular orbital speed decreases as altitude increases.
- Orbital period increases as altitude increases.
- LEO satellites complete several orbits during one sidereal day.
- A GEO satellite has an orbital period close to one sidereal day.
- GEO validation error is small when the stated constants and altitude are used.

## 7. How to Run

### MATLAB Desktop

1. Download or clone this repository.
2. Open MATLAB.
3. Set the Current Folder to the project directory.
4. Open `orbitalscript1.m`.
5. Click **Run**.
6. Review the numerical table, Command Window output and generated figures.

### MATLAB Online

1. Upload `orbitalscript1.m` to MATLAB Online.
2. Open the script.
3. Click **Run**.
4. Review the generated results and figures.

No external data files are required for Stage 1.

## 8. Project Roadmap

### Completed

- [x] Define the two-body orbital model.
- [x] Calculate analytical circular orbital speed.
- [x] Calculate analytical orbital period.
- [x] Calculate the number of orbits per sidereal day.
- [x] Validate the GEO orbital period.
- [x] Generate LEO and GEO comparison plots.

### Planned

- [ ] Implement the two-body equations of motion.
- [ ] Use MATLAB `ode45` for numerical orbit propagation.
- [ ] Plot two-dimensional LEO and GEO trajectories.
- [ ] Simulate elliptical orbits by changing initial velocity.
- [ ] Calculate numerical orbital periods from propagated trajectories.
- [ ] Compare numerical and analytical orbital periods.
- [ ] Compare numerical and analytical orbital speeds.
- [ ] Investigate numerical conservation of energy and angular momentum.

## 9. Project Limitations

This project currently uses an educational two-body orbital model.

The initial model does not include:

- Atmospheric drag.
- Earth's non-spherical gravity field.
- Solar radiation pressure.
- Third-body gravitational effects.
- Launch injection errors.
- Real satellite tracking data.

These effects may be considered in future improvements.

## 10. Project Structure

```text
two-body-orbit-simulation-matlab/
│
├── orbitalscript1.m
├── README.md
├── LICENSE
│
└── results/
    ├── results_table.png
    ├── leo_plots.png
    └── geo_plots.png
```

The `results/` folder is optional and can be used to store exported figures and tables.

## 11. License

This project is licensed under the MIT License.

See the `LICENSE` file for details.

