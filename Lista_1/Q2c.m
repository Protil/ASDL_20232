clear 

clc

close all

R = 1; % Valor do Resistor 

L = 1; % Valor do Indutor

T = L / R / 1e2; % Mantém a relação do intervalo de tempo estabelecida inicialmente no circuito RC

syms y(t);

Dy = diff(y);

y = dsolve(1 == L/R *Dy + y, y(0) == 0);

t1 = 0:T: 5 * L/R; % Array dos intervalos para calcular o grafico das funções

y1 = subs(y, t, t1);
figure(1);
subplot(2, 1, 1);
plot(t1, y1);
xlabel('Tempo (s)');
ylabel('Tensão de Saída (V)');
title('Resposta ao Degrau Diferencial');

grid;

subplot(2,1,2);
h = diff(y);
h1 = subs(h,t,t1);
plot(t1, h1);

xlabel('Tempo (s)');
ylabel('Tensão saída (V)');
title('Resposta Impulsiva');
grid;





