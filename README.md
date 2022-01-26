# Solver for General Rayleigh-Plesset Equation

Solving the general Rayleigh-Plesset Equation using ODE45 in MATLAB.

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

Where *f*<sub>1</sub> (*R*, *Ṙ*) = *Ṙ* and *f*<sub>2</sub> (*R*, *Ṙ*) is found by 
rearranging the Rayleigh-Plesset equation above and solving for the second derivative of *R*.

<!-- $$
f_1 (R, \dot{R}) = \dot{R}
$$ --> 

<div align="center"><img style="background: white;" src="https://latex.codecogs.com/svg.latex?f_1%20(R%2C%20%5Cdot%7BR%7D)%20%3D%20%5Cdot%7BR%7D%0D"></div>

<!-- $$
f_2(R, \dot{R}) = \frac{p_B - p_{\infty}}{R \rho_L} - \frac{3}{2} \frac{\dot{R}^2}{R} - \frac{4\nu_L \dot{R}}{R^2} - \frac{2S}{R^2 \rho_L}
$$ --> 

<div align="center"><img style="background: white;" src="https://latex.codecogs.com/svg.latex?f_2(R%2C%20%5Cdot%7BR%7D)%20%3D%20%5Cfrac%7Bp_B%20-%20p_%7B%5Cinfty%7D%7D%7BR%20%5Crho_L%7D%20-%20%5Cfrac%7B3%7D%7B2%7D%20%5Cfrac%7B%5Cdot%7BR%7D%5E2%7D%7BR%7D%20-%20%5Cfrac%7B4%5Cnu_L%20%5Cdot%7BR%7D%7D%7BR%5E2%7D%20-%20%5Cfrac%7B2S%7D%7BR%5E2%20%5Crho_L%7D%0D"></div>



## Bubble Contents

The bubble contains some gas with partial pressure *p*<sub>*G*<sub>0</sub></sub> 
at radius *R*<sub>0</sub> and temperature *T*<sub>∞</sub> and contains vapor with pressure *p*<sub>v</sub>. The temperature inside the bubble is *T*<sub>*B*</sub> and the vapor pressure is *p*<sub>*V*</sub>.
The pressure inside the bubble is given by

<img src="https://latex.codecogs.com/png.image?\dpi{200}&space;\bg_white&space;p_B(t)&space;=&space;p_V(T_B)&space;&plus;&space;p_{G_0}\left(\frac{T_B}{T_{\infty}}\right)\left(\frac{R_0}{R}\right)^3&space;" title="\bg_white p_B(t) = p_V(T_B) + p_{G_0}\left(\frac{T_B}{T_{\infty}}\right)\left(\frac{R_0}{R}\right)^3 " />

Assuming the absence of thermal effects, i.e. in an inertially controlled setup, this becomes

<img src="https://latex.codecogs.com/png.image?\dpi{200}&space;\bg_white&space;p_B(t)&space;=&space;p_V(T_B)&space;&plus;&space;p_{G_0}\left(\frac{R_0}{R}\right)^3&space;" title="\bg_white p_B(t) = p_V(T_B) + p_{G_0}\left(\frac{R_0}{R}\right)^3 " /> .

Assuming equilibrium conditions, i.e. *p*<sub>B</sub> = *p*<sub>v</sub> , *T*<sub>B</sub> = *T*<sub>∞</sub> , and the first and second derivative of *R* is zero, *p*<sub>G<sub>0</sub></sub> is given below.

<!-- $$
p_{G_0} = \frac{2S}{R_0} + p_{\infty}(0) - p_V (T_B)
$$ --> 

<div align="center"><img style="background: white;" src="https://latex.codecogs.com/svg.latex?p_%7BG_0%7D%20%3D%20%5Cfrac%7B2S%7D%7BR_0%7D%20%2B%20p_%7B%5Cinfty%7D(0)%20-%20p_V%20(T_B)%0D"></div>


## Pressure at Infinity

For the pressure at infinity we use a Gaussian waveform:

<img src="https://latex.codecogs.com/png.image?\dpi{200}&space;\bg_white&space;p_{\infty&space;0}&space;(1&space;-&space;A\exp(-(t/t_w)^2))&space;" title="\bg_white p_{\infty 0} (1 - A\exp(-(t/t_w)^2)) " />

where *p*<sub>∞0</sub> and *A* are constants and *t*<sub>*w*</sub> is the time scale.
