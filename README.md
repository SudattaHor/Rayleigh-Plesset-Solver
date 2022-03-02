# Solver for Rayleigh-Plesset Equation
Accounting for surface tension and buckling.

## Usage

- In `main`, you can adjust the initial radius and initial radius velocity, the amount of time elapsed, and the type of applied pressure (see `m_p` for the different types of switch cases).
- In `f_call_parameters`, you can adjust parameters of the simulation (e.g. bubble surface tension, liqudid density, etc.). `Stoggle` toggles between constant surface tension and piecewise surface tension.
- `m_buckling_rp` solves for the Rayleigh Plesset Equation accounting for buckling and rupture (Equation 3 in Marmottant [[1]](https://github.com/SudattaHor/Rayleigh-Plesset-Solver/edit/general/README.md#references)).
- `m_general_rp` solves for the general form of the Rayleigh Plesset Equation (Equation 2.10 in Brennen [[2]](https://github.com/SudattaHor/Rayleigh-Plesset-Solver/edit/general/README.md#references)).

## References

[1] 2005 Marmmotant - "A model for large amplitude oscillations of coated bubbles accounting for buckling and rupture"

[2] 1995 Christoper E. Brennen - *Cavitation and Bubble Dynamics*
