# Solver for Rayleigh-Plesset Equation
Accounting for surface tension and buckling.

## Usage

- In `main`, you can adjust the initial radius and initial radius velocity, the amount of time elapsed, and the type of applied pressure (see `m_p` for the different types of switch cases).
- In `f_call_parameters`, you can adjust parameters of the simulation (e.g. bubble surface tension, liqudid density, etc.).
- `m_rayleigh_plesset` solves for the Rayleigh Plesset Equation.

## References

[1] 2005 Marmmotant - "A model for large amplitude oscillations of coated bubbles accounting for buckling and rupture"

[2] 1995 Christoper E. Brennen - *Cavitation and Bubble Dynamics*
