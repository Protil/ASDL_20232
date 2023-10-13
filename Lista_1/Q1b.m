clear 

clc

close all

R = 1; % Valor do Resistor 

L = 1; % Valor do Indutor

T = L / R / 1e2; % Mantém a relação do intervalo de tempo estabelecida inicialmente no circuito RC

syms y(t);

Dy = diff(y);

y = dsolve(1 == L/R *Dy + y, y(0) == 0);



figure(1);


subplot(2, 2, 1);
t1 = 0:T: 5 * L/R; % Array dos intervalos para calcular o grafico das funções
y1 = subs(y, t, t1);
plot(t1, y1);
xlabel('Tempo (s)');
ylabel('Tensão de Saída (V)');
title('Resposta ao Degrau Diferencial 5 \tau');
grid;


subplot(2, 2, 2);
t1 = 0:T: 1 * L/R; % Array dos intervalos para calcular o grafico das funções
y1 = subs(y, t, t1);
plot(t1, y1);
xlabel('Tempo (s)');
ylabel('Tensão de Saída (V)');
title('Resposta ao Degrau Diferencial 1 \tau');
grid;

subplot(2, 2, [3 4]);
t1 = 0:T: 10 * L/R; % Array dos intervalos para calcular o grafico das funções
y1 = subs(y, t, t1);
plot(t1, y1);
xlabel('Tempo (s)');
ylabel('Tensão de Saída (V)');
title('Resposta ao Degrau Diferencial 10 \tau');
grid;




