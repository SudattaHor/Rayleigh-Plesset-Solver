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

$$\\frac{p_B(t) - p\_{ \\infty }(t)}{\\rho_L} = R \\ddot{R} + \\frac{3}{2} (\\dot{R})^2 + \\frac{4\\nu_L}{R} \\dot{R}+ \\frac{2S}{\\rho_L R}$$

<img src="https://latex.codecogs.com/png.image?\dpi{200}&space;\bg_white&space;\frac{p_B&space;-&space;p_{&space;\infty&space;}}{\rho_L}&space;=&space;R&space;\frac{\mathrm{d}^2R}{\mathrm{d}t^2}&space;&plus;&space;\frac{3}{2}&space;\left(&space;\frac{\mathrm{d}R}{\mathrm{d}t}&space;\right)^2&space;&plus;&space;\frac{4\nu_L}{R}&space;\frac{\mathrm{d}R}{\mathrm{d}t}&space;&plus;&space;\frac{2S}{\rho_L&space;R}" title="\bg_white \frac{p_B - p_{ \infty }}{\rho_L} = R \frac{\mathrm{d}^2R}{\mathrm{d}t^2} + \frac{3}{2} \left( \frac{\mathrm{d}R}{\mathrm{d}t} \right)^2 + \frac{4\nu_L}{R} \frac{\mathrm{d}R}{\mathrm{d}t} + \frac{2S}{\rho_L R}" />

<img src="http://www.sciweavers.org/tex2img.php?eq=%5Cbegin%7Bitemize%7D%0A%20%20%20%20%5Citem%20%24R%24%20is%20the%20bubble%20radius%2C%20and%20the%20overdot%20denotes%20%24%5Cmathrm%7Bd%7D%2F%5Cmathrm%7Bd%7Dt%24.%0A%20%20%20%20%5Citem%20%24p_B%24%20is%20the%20pressure%20inside%20the%20bubble%2C%20assumed%20to%20be%20uniform.%0A%20%20%20%20%5Citem%20%24p_%7B%5Cinfty%7D%24%20is%20the%20pressure%20of%20the%20liquid%20at%20infinity%2C%20assumed%20to%20be%20uniform.%0A%20%20%20%20%5Citem%20%24%5Crho_L%24%20is%20the%20density%20of%20the%20liquid%2C%20assumed%20to%20be%20constant.%0A%20%20%20%20%5Citem%20%24%5Cnu_L%24%20is%20the%20kinematic%20viscosity%20of%20the%20liquid.%0A%20%20%20%20%5Citem%20%24S%24%20is%20the%20surface%20tension%20of%20the%20bubble.%0A%5Cend%7Bitemize%7D&bc=White&fc=Black&im=jpg&fs=18&ff=modern&edit=0" align="center" border="0" alt="\begin{itemize}    \item $R$ is the bubble radius, and the overdot denotes $\mathrm{d}/\mathrm{d}t$.    \item $p_B$ is the pressure inside the bubble, assumed to be uniform.    \item $p_{\infty}$ is the pressure of the liquid at infinity, assumed to be uniform.    \item $\rho_L$ is the density of the liquid, assumed to be constant.    \item $\nu_L$ is the kinematic viscosity of the liquid.    \item $S$ is the surface tension of the bubble.\end{itemize}" width="712" height="277" />

*t**e**s**t*

-   y

$\\sqrt{2}$