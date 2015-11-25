clearvars
clc

s = tf('s');

b0 = 1;
b1 = 1;
a0 = 1;
a1 = 1;
a2 = 1;
a3 = 1;

G = (s + 1)/(s^3+s^2+s+1);
bode(G)