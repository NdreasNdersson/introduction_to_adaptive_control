clearvars
clc

ap = -6;
cp = 1;
kp = 1;

am = 1;
cm = 1;
km = 1;

u0 = 0;

dxp0 = 0;
xp0 = 0;

dxm0 = 0;
xm0 = 0;

theta0 = [0 0 0 0 0]';

gamma = eye(5);%diag([100 100 100 100]);


