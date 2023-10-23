


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


subplot(2,2,2);
h = diff(y);
h1 = subs(h, t , t1);
plot(t1, h1);
xlabel('tempo (s)');
ylabel('tensão de saída (V)');
title('Resposta Impulsiva');
grid

Lu = 50;
t2 = linspace(0,R*C, Lu);
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





figure(2);

periodo = R*C; dur = 10*R*C;
[x, tx] = gensig("sin", periodo, dur, T);

s = conv(x, h1d)*T;
Ls = length(s);
t3 = linspace(0, Ls*T, Ls);

plot(tx, x);
hold on
plot(t3, s);
grid;
legend('entrada', 'saida');
title('Sistema de 1a. ordem');
hold off










