# Solver for Rayleigh-Plesset Equation
Accounting for surface tension and buckling.

## Usage

- In `main`, you can adjust the initial radius and initial radius velocity, the amount of time elapsed, and the type of applied pressure (see `m_p` for the different types of switch cases).
- In `f_call_parameters`, you can adjust parameters of the simulation (e.g. bubble surface tension, liqudid density, etc.). `Stoggle` toggles between constant surface tension and piecewise surface tension.
- `m_buckling_rp` solves for the Rayleigh Plesset Equation accounting for buckling and rupture (Equation 3 in Marmottant [[1]](https://github.com/SudattaHor/Rayleigh-Plesset-Solver/edit/general/README.md#references)).
- `m_general_rp` solves for the general form of the Rayleigh Plesset Equation (Equation 2.10 in Brennen [[2]](https://github.com/SudattaHor/Rayleigh-Plesset-Solver/edit/general/README.md#references)).

## Results

Results for constant applied pressure:

![fig9](https://user-images.githubusercontent.com/84194796/155335789-0e1b2d6b-53ab-4e07-ad71-e4c7b16d170a.png)

![fig10](https://user-images.githubusercontent.com/84194796/155335740-f4208acb-4231-4ca4-b89b-90fbfdb8b7d8.png)

![fig11](https://user-images.githubusercontent.com/84194796/155335713-f21d59d6-f7aa-4a7c-a3a1-8ba834c407d5.png)

![fig12](https://user-images.githubusercontent.com/84194796/155335836-bb33e009-7f4d-4a53-94f7-14695a5e28f3.png)

We replicate Figure 5 from Marmottant [[1]](https://github.com/SudattaHor/Rayleigh-Plesset-Solver/edit/general/README.md#references).

![marmottant - fig5](https://user-images.githubusercontent.com/84194796/155336411-d129e40c-0337-46a3-aeb9-3d3cfa7f29a8.png)

![fig14](https://user-images.githubusercontent.com/84194796/155336455-f15bee1c-dede-4684-9f3c-8c21d348445d.png)

## References

[1] 2005 Marmmotant - "A model for large amplitude oscillations of coated bubbles accounting for buckling and rupture"

[2] 1995 Christoper E. Brennen - *Cavitation and Bubble Dynamics*
