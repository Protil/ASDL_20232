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
subplot(2, 2, 1);
plot(t1, y1);
xlabel('Tempo (s)');
ylabel('Tensão de Saída (V)');
title('Resposta ao Degrau Diferencial');

grid;

subplot(2,2,2);
h = diff(y);
h1 = subs(h,t,t1);
plot(t1, h1);

xlabel('tempo (s)');
ylabel('tensão saída (V)');
title('Resposta Impulsiva');
grid;
Lu = 50;
t2 = linspace(0,L/R, Lu);
u = ones(1, Lu);
h1d = double(h1);
s = conv(u, h1d)*T;
    

Ls = length(s);

t3 = linspace(0, Ls*T, Ls);
subplot(2, 2, 3);
hold on;  
plot(t3, [u zeros(1, Ls - Lu)]);
    
%subplot(2,2, 4);
plot(t3, s);
hold off;
grid






