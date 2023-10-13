clear 

clc

close all

R = 1e3;

C = 100e-9;

T = 1e-6;

syms y(t);

Dy = diff(y);

y = dsolve(1 == R*C*Dy + y, y(0) == 0);

t1 = 0:T: 5*R*C;

y1 = subs(y, t, t1);

figure(1);

subplot(2, 2, 1);

plot(t1, y1);

xlabel('tempo (s)');
ylabel('tensão de saída (V)');
title('Resposta ao degrau');

grid