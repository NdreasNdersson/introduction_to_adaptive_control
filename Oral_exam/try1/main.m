clearvars
clc

ap = 6/5; 
bp = 1/5;
cp = -1/5;
kp = -1/5;

am = -1;
km = 1;

u0 = 0;

ddxp0 = 0;
dxp0 = 0;
xp0 = 0;

xm0 = 0;

theta0 = [0 0 0 0]';

gamma = diag([100 100 100 100]);

salpha = -bp/cp
sbeta = (am-ap)/cp
sdelta = -kp/cp
szeta = km/cp
