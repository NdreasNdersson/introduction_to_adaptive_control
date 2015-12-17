clc
clearvars

s = tf('s');

k = [-1000:1:1000];
G = 1 / (s^2 - s + 1)

rlocusplot(G, k)