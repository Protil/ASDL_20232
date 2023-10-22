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
f = figure(1);

currentPosition = get(gcf, 'Position');
currentPosition(2) = 200;
currentPosition(3) = 600;
currentPosition(4) = 600;
set(gcf, 'Position', currentPosition);

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
title(sprintf('Lu = %i', Lu));

%subplot(2,2, 4);
plot(t3, s);
hold off;

slider = uicontrol('style','slider','units','pixel','position',[81,10,419,23], "min", 0, "max",500);
slider.Value = 50;


slider_Max = uicontrol('Parent',f,'Style','text','Position',[60,5,23,23],...
                'String','0','BackgroundColor',f.Color);
slider_Min = uicontrol('Parent',f,'Style','text','Position',[510,5,23,23],...
                'String','500','BackgroundColor',f.Color);

addlistener(slider,'ContinuousValueChange',@(sliderObj, event) MudancaSlide(sliderObj, event, T, Ls, s, L, R, h1));


function MudancaSlide(sliderObj, event, T, Ls, s, L, R, h1)
    
    cla % Limpa o antigo grafico, zerando os dois eixos


    Lu = round(get(sliderObj,'Value')); % Pega o 
    
    title(sprintf('Lu = %i', Lu));

    t2 = linspace(0,L/R, Lu);
    u = ones(1, Lu);
    h1d = double(h1);
    s = conv(u, h1d)*T;
    
    Ls = length(s);
    
    t3 = linspace(0, Ls*T, Ls);
    
    subplot(2, 2, 3);
        
    hold on;
    
    plot(t3, [u zeros(1, Ls - Lu)]);
    
    plot(t3, s);
    hold off;

end 

