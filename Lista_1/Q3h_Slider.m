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



f = figure(2);

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

% Info para o display
currentPosition = get(gcf, 'Position');
currentPosition(2) = 200;
currentPosition(3) = 600;
currentPosition(4) = 500;
set(gcf, 'Position', currentPosition);
% Info slider 
slider = uicontrol('style','slider','units','pixel','position',[81,10,419,23], "min", 1, "max",100);
slider.Value = 10;
slider_Max = uicontrol('Parent',f,'Style','text','Position',[30,7,50,23],...
                'String','1/(10L/R)','BackgroundColor',f.Color);
slider_Min = uicontrol('Parent',f,'Style','text','Position',[500,7,50,23],...
                'String',"10/(L/R)",'BackgroundColor',f.Color);

addlistener(slider,'ContinuousValueChange',@(sliderObj, event) MudancaSlide(sliderObj, event, T, Ls, s, L, R, h1, h1d));


function MudancaSlide(sliderObj, event, T, Ls, s, L, R, h1, h1d)
    
    cla % Limpa o antigo grafico, zerando os dois eixos

    slider_valor = get(sliderObj,'Value');
    periodo = 1 / (10 *(L/R)) * slider_valor ; dur = 10*L/R;
    [x, tx] = gensig("sin", periodo, dur, T);
    
    s = conv(x, h1d)*T;
    Ls = length(s);
    t3 = linspace(0, Ls*T, Ls);
    plot(tx, x);
    hold on
    plot(t3, s);
    grid;
    legend('entrada', 'saida');
    % Permite uma melhor compressão do comportamento do sistema a media que
    % tau muda
    defasagem = finddelay(x, s) * T * 360/periodo

    title('Resposta RL Onda Senoidal Frequência Variante');
    subtitle(sprintf('Amplitude Máxima(V) = %i\nFrequência(Hz) = %i\nDefasagem(Graus): %i', max(s), 1/periodo, defasagem))

    hold off
    








 



end 




