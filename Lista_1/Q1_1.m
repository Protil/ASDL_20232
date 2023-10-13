clear 

clc

close all

R = 1; % Valor do Resistor 

L = 1; % Valor do Indutor


T = L / R / 1e2; % Mantém a relação do intervalo de tempo estabelecida inicialmente no circuito RC

syms y(t);

Dy = diff(y);

y = dsolve(1 == L/R *Dy + y, y(0) == 0);

t1 = 0:T: 5 * L/R;

y1 = subs(y, t, t1);

figure(1);

subplot(2, 2, 1);

plot(t1, y1);

xlabel('tempo (s)');
ylabel('tensão de saída (V)');
title('Resposta ao degrau');

grid


y = 1*(1 - exp(-(R/L)*t)); 

t1 = 0:T: 5 * L/R;

y1 = subs(y, t, t1)

subplot(2, 2, 2);

plot(t1, y1);










grid