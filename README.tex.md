# Solver for General Rayleigh-Plesset Equation

## Setup

Consider a gas-filled bubble in an infinite domain of liquid. There is no mass transfer
of gas to or from the liquid.

- Liquid density is constant (although compressibility is important).
- Liquid is at rest at a distance far from the bubble.
- Liquid temperature is uniform at a distance far from the bubble.
- Liquid's dynamic viscosity is constant and uniform.
- Bubble contents are homogenous and its temperature and pressure are uniform.

## Equation

$$\frac{p_B(t) - p_{ \infty }(t)}{\rho_L} = R \ddot{R} + \frac{3}{2} (\dot{R})^2 + \frac{4\nu_L}{R} \dot{R}+ \frac{2S}{\rho_L R}$$