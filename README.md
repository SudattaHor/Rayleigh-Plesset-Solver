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

The general Rayleigh-Plesset equation is written below.

<img src="https://latex.codecogs.com/png.image?\dpi{200}&space;\bg_white&space;\frac{p_B&space;-&space;p_{&space;\infty&space;}}{\rho_L}&space;=&space;R&space;\frac{\mathrm{d}^2R}{\mathrm{d}t^2}&space;&plus;&space;\frac{3}{2}&space;\left(&space;\frac{\mathrm{d}R}{\mathrm{d}t}&space;\right)^2&space;&plus;&space;\frac{4\nu_L}{R}&space;\frac{\mathrm{d}R}{\mathrm{d}t}&space;&plus;&space;\frac{2S}{\rho_L&space;R}" title="\bg_white \frac{p_B - p_{ \infty }}{\rho_L} = R \frac{\mathrm{d}^2R}{\mathrm{d}t^2} + \frac{3}{2} \left( \frac{\mathrm{d}R}{\mathrm{d}t} \right)^2 + \frac{4\nu_L}{R} \frac{\mathrm{d}R}{\mathrm{d}t} + \frac{2S}{\rho_L R}" />

-   *R* is the bubble radius, and the overdot denotes d/d*t*.

-   *p*<sub>*B*</sub> is the pressure inside the bubble, assumed to be
    uniform.

-   *p*<sub>∞</sub> is the pressure of the liquid at infinity, assumed
    to be uniform.

-   *ρ*<sub>*L*</sub> is the density of the liquid, assumed to be
    constant.

-   *ν*<sub>*L*</sub> is the kinematic viscosity of the liquid.

-   *S* is the surface tension of the bubble.

## Solver

We use the ODE45 solver to solve the differential equation

<img src="https://latex.codecogs.com/png.image?\dpi{200}&space;\bg_white&space;\begin{pmatrix}\dot{R}&space;\\&space;\ddot{R}&space;\end{pmatrix}&space;=&space;&space;\begin{pmatrix}f_1(R,&space;\dot{R})&space;\\&space;f_2(R,&space;\dot{R})&space;\end{pmatrix}&space;" title="\bg_white \begin{pmatrix}\dot{R} \\ \ddot{R} \end{pmatrix} = \begin{pmatrix}f_1(R, \dot{R}) \\ f_2(R, \dot{R}) \end{pmatrix} " />

Where *f*<sub>1</sub>(*R*, *Ṙ*) = *Ṙ* and *f*<sub>2</sub>(*R*) is found by 
rearranging the Rayleigh-Plesset equation above and solving for the second derivative of *R*.
The temperature inside the bubble is *T*<sub>*B*</sub> and the vapor
pressure is *p*<sub>*V*</sub>.

## Bubble Contents

Assuming that the bubble contains some gas with partial pressure *p*<sub>*G*<sub>0</sub> 
at radius *R*<sub>0</sub> and temperature *T*<sub>∞</sub>.
The pressure inside the bubble is given by

<img src="https://latex.codecogs.com/svg.image?\bg_white&space;p_B(t)&space;=&space;p_V(T_B)&space;&plus;&space;p_{G_0}\left(\frac{T_B}{T_{\infty}}\right)\left(\frac{R_0}{R}\right)^3" title="\bg_white p_B(t) = p_V(T_B) + p_{G_0}\left(\frac{T_B}{T_{\infty}}\right)\left(\frac{R_0}{R}\right)^3" />

Assuming the absence of thermal effects, i.e. in an inertially controlled setup, this becomes

<img src="https://latex.codecogs.com/svg.image?\bg_white&space;p_B(t)&space;=&space;p_V(T_B)&space;&plus;&space;p_{G_0}\left(\frac{R_0}{R}\right)^3" title="\bg_white p_B(t) = p_V(T_B) + p_{G_0}\left(\frac{R_0}{R}\right)^3" />

## Pressure at Infinity

For the pressure at infinity we use a Gaussian waveform:

<img src="https://latex.codecogs.com/svg.image?\bg_white&space;p_{\infty&space;0}&space;(1&space;-&space;A\exp(-(t/t_f)^2))" title="\bg_white p_{\infty 0} (1 - A\exp(-(t/t_f)^2))" />

where *p*<sub>∞0</sub> and *A* are constants and *t*<sub>*f*</sub> is the time scale.

