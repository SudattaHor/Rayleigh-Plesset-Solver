\documentclass[12pt]{article}

\begin{document}

$$\frac{p_B(t) - p_{ \infty }(t)}{\rho_L} = R \ddot{R} + \frac{3}{2} (\dot{R})^2 + \frac{4\nu_L}{R} \dot{R}+ \frac{2S}{\rho_L R}$$

\begin{itemize}
    \item $R$ is the bubble radius, and the overdot denotes $\mathrm{d}/\mathrm{d}t$.
    \item $p_B$ is the pressure inside the bubble, assumed to be uniform.
    \item $p_{\infty}$ is the pressure of the liquid at infinity, assumed to be uniform.
    \item $\rho_L$ is the density of the liquid, assumed to be constant.
    \item $\nu_L$ is the kinematic viscosity of the liquid.
    \item $S$ is the surface tension of the bubble.
\end{itemize}

\section{$p_B$}
We know the pressure inside the bubble
$$p_B(t) = p_V(T_B) + p_{G_0}\left(\frac{T_B}{T_{\infty}}\right)\left(\frac{R_0}{R}\right)^3$$
where $p_{G_0}$ is the partial pressure at reference size $R_0$ and temperature $T_{\infty}$. The temperature inside the bubble is $T_B$ and the vapor pressure is $p_V$.

\section{absence of thermal effects}
Consider the absence of thermal effects. This is "inertially controlled", distinguished from "thermally controlled". Assume that the gas in bubble is polytropic i.e.
$$p_{G_0} V^k$$
is constant.

where $k$ is assumed constant. $k = 1$ implies constant bubble temperature and $k = \gamma$ models adiabatic behavior. Then the general Rayleigh Plesset equation becomes

$$\frac{p_V(T_{\infty}) - p_{\infty}(t)}{\rho_L} + \frac{p_{G_0}}{\rho_L} \left( \frac{R_0}{R} \right)^{3k} = R \ddot{R} + \frac{3}{2} (\dot{R})^2 + \frac{4\nu_L}{R} \dot{R}+ \frac{2S}{\rho_L R}$$
\end{document}
