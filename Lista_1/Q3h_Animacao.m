 clear 

clc

close all
obj = VideoWriter("Variação da Frequencia Angular_90FPS", "MPEG-4");
obj.Quality = 100;
obj.FrameRate = 90;
open(obj)

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



f = figure(2);

currentPosition = get(gcf, 'Position');
currentPosition(2) = 200;
currentPosition(3) = 600;
currentPosition(4) = 500;
set(gcf, 'Position', currentPosition);

periodo = L/R; dur = 10*L/R;
[x, tx] = gensig("sin", periodo, dur, T);

s = conv(x, h1d)*T;
Ls = length(s);
t3 = linspace(0, Ls*T, Ls);

plot(tx, x);
hold on
plot(t3, s);
grid;
legend('saida');
defasagem = finddelay(x, s) * T * 360/periodo

title('Resposta RL Onda Senoidal Frequência Variante');
subtitle(sprintf('Amplitude Máxima(V) = %i\nFrequência(Hz) = %i\nDefasagem(Graus): %i', max(s), 1/periodo, defasagem))
hold off


for coeficiente_fw = 1:0.1:100
    cla % Limpa o antigo grafico, zerando os dois eixos

    periodo = 1 / (10 *(L/R)) * coeficiente_fw ; dur = 10*L/R;
    [x, tx] = gensig("sin", periodo, dur, T);
    
    s = conv(x, h1d)*T;
    Ls = length(s);
    t3 = linspace(0, Ls*T, Ls);
    
    plot(tx, x);
    hold on
    plot(t3, s);
    grid;
    legend('entrada', 'saida');
    %title('Sistema de 1a. ordem');
    defasagem = finddelay(x, s) * T * 360/periodo

    title('Resposta RL Onda Senoidal Variante');
subtitle(sprintf('Amplitude Máxima(V) = %i\nFrequência(Hz) = %i\nDefasagem(Graus): %i', max(s), 1/periodo, defasagem))

    hold off
    writeVideo(obj, getframe(gcf));
end
close(obj)




