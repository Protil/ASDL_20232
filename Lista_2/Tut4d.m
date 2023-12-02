clear; close all; clc

wn = 2;           % rad/s
zeta = 0.01;       % executar com zeta = 0.01 também

Num = wn^2;
Den = [1 2*zeta*wn wn^2];
H = tf(Num, Den);

w = logspace(0, 1, 1000);   % 500 pontos entre 10^0 e 10^1
bode(H, w);                % Hw: 1 x 1 x length(w)
grid;
title('Sistema de 2a ordem');  % sobrepõe ao título default 
str = ['\omega_n = ', num2str(wn), ' Hz', ' \zeta = ', num2str(zeta)];
gtext(str);