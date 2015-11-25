%%
clear all
clc
load('sim_3.mat')
log_param = param;
%%
norm_scale = 0.05;
J = (1 - norm_scale) * save_e_norm + norm_scale * save_u_norm;
[minimun, i] = min(J(:));
[i, j] = ind2sub(size(save_e_norm), i)
[a, b] = meshgrid(log_param, log_param);

gamma = log_param(i)
l = -log_param(j)

[a, b] = meshgrid(log_param, log_param);
surf(-a, b, J)
caxis([0.05, 0.6])
%colormap(hot)

shading interp
%light               % create a light
light('Position',[10000 -10000 20],'Style','local')
lighting gouraud    % prefered method for lighting curved surfaces
material dull    % set material to be dull, no specular highlights

xlabel('l');
ylabel('gamma');
zlim([0, 0.6])