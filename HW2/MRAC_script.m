%%%%%%%%%%%%%%%%%%%%%%%%%%%%---MRAC---%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all

% Run multiple simulations
run_mult = false;

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
Gamma_f =@(a) eye(6)*a;
l_f =@(b) -1*(b);

%different nonlinearities (comment out the unused)
theta_f=[0.01 -1 1 0.5];
%theta_f=[0 -1 1 0];

if run_mult
    log_param = logspace(1, 4, 10);
    nParam = length(log_param);
    save_e_norm = zeros(nParam);
    save_u_norm = zeros(nParam);
    h = waitbar(0,'Sim in porgress...');
    for i = 1:length(log_param)
        for j = 1:length(log_param)
            waitbar((i*nParam)/(nParam^2),h)
            Gamma = Gamma_f(log_param(i));
            l = l_f(log_param(j));
            sim('nonlinear_Plant', 10)
            e_norm = norm(error.signals.values(:,1));
            u_norm = norm(diff(input.signals.values));
            save_e_norm(i,j) = e_norm;
            save_u_norm(i,j) = u_norm;
        end
    end

    %%
    norm_scale = 0.2;
    J = (1 - norm_scale) * save_e_norm + norm_scale * save_u_norm;
    [~, i] = min(J(:));
    [i, j] = ind2sub(size(save_e_norm), i)
    [a, b] = meshgrid(log_param, log_param);
    surf(a, b, J)

    xlabel('l');
    ylabel('gamma');
else
    Gamma = Gamma_f(10000);
    l = l_f(2.1711e+03);
end