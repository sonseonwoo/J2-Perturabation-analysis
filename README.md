# J2-Perturbation-analysis

This repository performs **J2 perturbation effect analysis** on Earth orbits using MATLAB. It numerically propagates orbital elements, extracts secular variation rates (RAAN, AoP), and reproduces classical nodal regression and apsidal rotation diagrams — based on *Vallado's Fundamentals of Astrodynamics and Applications (5th Edition)*.

## Purpose

This project visualizes the long-term evolution of orbital elements caused by the Earth's oblateness (J2). The main goal is to:

- Validate RAAN (Ω̇) and AoP (ω̇) variation trends over inclination
- Compare numerical results to analytical models
- Reproduce canonical J2-induced rate vs. inclination plots

## Repository Structure

| File                          | Description                                                       |
|-------------------------------|-------------------------------------------------------------------|
| COE2RV.m                      | Convert orbital elements (COE) to position/velocity vectors (ECI) |
| RV2COE.m                      | Convert state vectors (rv) to COE with J2-aware energy term       |
| constants.m                   | Returns physical constants (μ, J2, Re)                            |
| rhs_J2.m                      | RHS function for Cowell-style orbit propagation under J2          |
| runJ2Prop.m                   | Propagates orbital state and returns time history of COE          |
| getRates.m                    | Performs polyfit on RAAN/AoP to extract rates (deg/day)           |
| collectRateGrid.m             | Sweeps altitude/inclination grid and stores Ω̇/ω̇                 |
| plot_j2_RAAN_vs_inclination.m | Generates RAAN regression plot vs. inclination                   |
| plot_j2_AoP_vs_inclination.m  | Generates AoP rotation plot vs. inclination                      |
| plotRateVsInc.m               | Combined visualization of both rates                             |
| plot_J2_effect_ratecollect.m  | Extended script to benchmark output                              |
| plot_J2_COE_evolution.m       | Visualize How orbital elements change over time                  |

## How to Run

Make sure all `.m` files are in your MATLAB path. Then execute:

    >> plotRateVsInc

Or run separately:

    >> plot_j2_RAAN_vs_inclination
    >> plot_j2_AoP_vs_inclination

This runs propagation over 3 days for a set of altitudes and inclination values.

## Output Example

- RAAN regression vs inclination (deg/day)
- AoP rotation vs inclination (deg/day)

These plots validate J2 secular effects across various orbital altitudes and inclinations.

## Reference

- Vallado, D. A., *Fundamentals of Astrodynamics and Applications*, 5th Ed.
- Constants: μ = 398600.4418 km^3/s^2, Re = 6378.1363 km, J2 = 1.0826269e-3

## Author

Seonwoo Son  
Initial version: 2023-07-31  
Maintained: 2025-06-20

---
별로 좋은 코드는 아니네. 한번 손 보던가 지워야할듯 
