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

% Função exponencial informada no estudo dirigido 
y_exp = 1*(1 - exp(-(R/L)*t)); 
y_exp_sub = subs(y_exp, t, t1);

subplot(2, 2, 2);
plot(t1, y_exp_sub);
xlabel('Tempo (s)');
ylabel('Tensão de Saída (V)');
title('Resposta ao Degrau Exponencial');

grid;

% Grafico de ambas as funções sobrepostas
subplot(2, 2, 3);
plot(t1, y1, t1, y_exp_sub);
legend('Diferencial', 'Exponencial')
xlabel('Tempo (s)');
ylabel('Tensão de Saída (V)');
title('Diferencial e Exponencial Sobrepostas');
grid;

% Grafico da diferença entre as funções
subplot(2, 2, 4);
plot(t1, y1 - y_exp_sub);
xlabel('Tempo (s)');
ylabel('Tensão de Saída (V)');
title('Diferença Diferencial e Exponencial');
grid;


func_iguais = isequal(y, y_exp); % Compara as duas funções e retorna 1 se forem iguais, senão 0

% Display no console da igualdade entre funções 
if (func_iguais)
    disp("As funções são iguais");
else 
    disp("As funções são diferentes");
end





