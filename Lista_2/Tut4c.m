clear
clc
close all 

wn = 1;
zeta = 0.8;
Num = [wn];
Den = [1 2*zeta*wn wn^2];
H = tf(Num, Den);       % cria função de transferência 

t = 0:0.1:10;
figure(1);
subplot(2,2,1);
st = step(H, t);  % step(H) gera um gráfico default 
plot(t, st);      % alternativa para detalhar figura 
grid; grid minor; % grades do gráfico 
title(['zeta = ', num2str(zeta)]);  % usa vetor de strings
xlabel('tempo [s]'); ylabel ('Resposta ao degrau [\mu a]');

subplot(2,2,2);
impulse(H);  %mais opções gráficas com impulseplot()

subplot(2,2,3);
pzmap(H)     %mais opções gráficas com pzplot()
p = roots(Den)  % calcula polos e imprime nas linhas de comando

subplot(2, 2, 4);
scatter(real(p), imag(p), 'x');
ylabel("Eixo Imaginario")
xlabel("Eixo Real")

grid;
str = strcat('\zeta = ', num2str(zeta));  % usa concatenação
title("Polos para:" + str)
