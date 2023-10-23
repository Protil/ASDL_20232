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



h = diff(y);
h1 = subs(h,t,t1);

Lu = 50;
t2 = linspace(0,L/R, Lu);
u = ones(1, Lu);
h1d = double(h1);
s = conv(u, h1d)*T;
    

Ls = length(s);

t3 = linspace(0, Ls*T, Ls);



figure(2);

periodo = L*R; dur = 10*L/R;
[x, tx] = gensig("sin", periodo, dur, T);

s = conv(x, h1d)*T;
Ls = length(s);
t3 = linspace(0, Ls*T, Ls);

%plot(tx, x);
hold on
plot(t3, s);
grid;
legend('saida');
title('Sistema de 1a. ordem');
hold off






