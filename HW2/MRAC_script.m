%%%%%%%%%%%%%%%%%%%%%%%%%%%%---MRAC---%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all

%referenec model parameters
a_m=-4;
k_m=4;

x_m_0=0;          %initial condition

%plant parameters
a_p=1;
k_p=3;
x_p_0=0;          %initial condition

%true parameters
theta_star=(a_m-a_p)/k_p;
k_star=k_m/k_p;

%parameter initial conditions
param_0=[0 0 0 0 0 0];

%adaptive gains:
Gamma=eye(6)*2;

%different nonlinearities (comment out the unused)
%theta_f=[0.01 -1 1 0.5];
theta_f=[0 -1 1 0];
