# Description of Figures

<<<<<<< HEAD
p_inf is the pressure at infinity.
p_atm is the atmospheric pressure.

## Figure 1

p_inf = p_atm

## Figure 2

p_inf = 2*p_atm

## Figure 3

p_inf = 0.5*p_atm

## Figure 4

p_inf = 2*p_atm

Kinematic viscosity is set to be high, around 1e-1

## Figure 5

p_inf = 10*p_atm

We start to see inertial collapse. t/t_c is the dimensionless time where t_c 
is the time for cavitation given by

<!-- $$
t_c = 0.915\left(\frac{\rho_L R_0^2}{p_inf}\right)^{\frac{1}{2}}
$$ --> 

<div align="center"><img style="background: white;" src="https://latex.codecogs.com/svg.latex?t_c%20%3D%200.915%5Cleft(%5Cfrac%7B%5Crho_L%20R_0%5E2%7D%7Bp_inf%7D%5Cright)%5E%7B%5Cfrac%7B1%7D%7B2%7D%7D%0D"></div>

This becomes more accurate in figure 6.

## Figure 6

p_inf = 100*p_atm
=======
## Prelim

- kappa = 1.4;           
- c = 1.48e3;             
- rho_L = 1e3;           
- P0 = 101325;            
- mu = 1;                
- kappa_s = 1.5e-10;     
- kai = 2e-1;            
- S_water = 7.3e-2;     
- S_break_up = 1.3e-1;    
- R_buckling = R0(1);     

### fig1

p(t) = 10atm

### fig2

p(t) = 2 atm

### fig3

p(t) = atm

### fig4

p(t) = 0.5atm


## Comparing Piecewise Surface Tension vs. Constant Surface Tension

Piecewise Surface Tension - given in Marmmotant
Constant Surface Tension - set to surface tension of water

- ac_freq = 2.9e6        
- ac_amp = 1.3e5  

### fig5

p_(t) = P0 + ac_amp * sin(2 * pi * ac_freq * (t - ac_shift))

### fig6

Labeled point is point of rupture

R_buckling =  0.8 * R0(1)

### fig7

--

## Comparing General vs. Buckling Case

Figures 8 - 13.

Comparing the general Rayleigh Plesset equation with the Rayleigh Plesset equation accounting for buckling.

## Recreating figure from 2007 Marmottant

Figure 14. See "marmmottant - fig5.PNG" for what we are trying to recreate.
>>>>>>> 788829547e9614b3c4197972177dfb7c49dca8f8
