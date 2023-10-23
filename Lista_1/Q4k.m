
close all
clear 
clc 

alfa = 0.1;
y_ant = 0;
N = 10000;
f1 = 1/40;
A1 = 1;
f2 = 1/5;
A2 = 0.5;
fs = 10e3;
t = 0:N-1;

x = A1*cos(2*pi*t*f1) + A2 * sin(2*pi*t*f2);
y = linspace(1, N);


for i=1:N
    y(i) = alfa*x(i) + (1-alfa)*y_ant;
    y_ant = y(i);
end 

f = figure(1);

slider_f2 = uicontrol('style','slider','units','pixel','position',[81,10,419,23], "min", 0, "max",1);
slider_f2.Value = 1/5;
slider_f2_Valor = uicontrol('Parent',f,'Style','text','Position',[200,40,200,23], 'String','f2 = 0.20','BackgroundColor',f.Color);
slider_f2_Max = uicontrol('Parent',f,'Style','text','Position',[60,5,23,23], 'String','0','BackgroundColor',f.Color);
slider_f2_Min = uicontrol('Parent',f,'Style','text','Position',[510,5,23,23],'String','1','BackgroundColor',f.Color);

slider_A2 = uicontrol('style','slider','units','pixel','position',[81,70,419,23], "min", 0, "max",1);
slider_A2.Value = 1/40;
slider_A2_Valor = uicontrol('Parent',f,'Style','text','Position',[200,100,200,23], 'String','A2 = 0.025','BackgroundColor',f.Color);
slider_A2_Max = uicontrol('Parent',f,'Style','text','Position',[60,65,23,23], 'String','0','BackgroundColor',f.Color);
slider_A2_Min = uicontrol('Parent',f,'Style','text','Position',[510, 65,23,23],'String','1','BackgroundColor',f.Color);

slider_alpha = uicontrol('style','slider','units','pixel','position',[81,130,419,23], "min", 0, "max",1);
slider_alpha.Value = 0.1;
slider_alpha_Valor = uicontrol('Parent',f,'Style','text','Position',[200,160,200,23], 'String','Alpha = 0.1','BackgroundColor',f.Color);
slider_alpha_Max = uicontrol('Parent',f,'Style','text','Position',[60,125,23,23], 'String','0','BackgroundColor',f.Color);
slider_alpha_Min = uicontrol('Parent',f,'Style','text','Position',[510,125,23,23],'String','1','BackgroundColor',f.Color);

addlistener(slider_f2,'ContinuousValueChange',@(sliderObj, event) MudancaSlide(sliderObj, event, slider_f2, slider_A2, slider_alpha, f));

addlistener(slider_A2,'ContinuousValueChange',@(sliderObj, event) MudancaSlide(sliderObj, event, slider_f2, slider_A2, slider_alpha, f));

addlistener(slider_alpha,'ContinuousValueChange',@(sliderObj, event) MudancaSlide(sliderObj, event, slider_f2, slider_A2, slider_alpha, f));

subplot(2,1,1);
hold ON
plot(x); plot(y);
xlabel('n');
legend('x[n]', 'y[n]'); title('Equação a diferenças finitas');
hold OFF


function MudancaSlide(sliderObj, event, slider_f2, slider_A2, slider_alpha, f)
    cla % Limpa o antigo grafico, zerando os dois eixos
    slider_alpha_Valor = uicontrol('Parent',f,'Style','text','Position',[200,160,200,23], 'String',sprintf('Alpha = %i', get(slider_alpha,'Value')),'BackgroundColor',f.Color);
    slider_f2_Valor = uicontrol('Parent',f,'Style','text','Position',[200,40,200,23], 'String',sprintf('f2 = %i', get(slider_f2,'Value')),'BackgroundColor',f.Color);
    slider_A2_Valor = uicontrol('Parent',f,'Style','text','Position',[200,100,200,23], 'String',sprintf('A2 = %i', get(slider_A2,'Value')),'BackgroundColor',f.Color);

    alfa = (get(slider_alpha,'Value'));
    y_ant = 0;
    N = 10000;
    f1 = 1/40;
    A1 = 1;
    f2 = (get(slider_f2,'Value'));
    A2 = (get(slider_A2,'Value'));
    fs = 10e3;
    t = 0:N-1;
    
    x = A1*cos(2*pi*t*f1) + A2 * sin(2*pi*t*f2);
    y = linspace(1, N);
    
    
    for i=1:N
        y(i) = alfa*x(i) + (1-alfa)*y_ant;
        y_ant = y(i);
    end 
    subplot(2,1,1);
    hold ON
    plot(x); plot(y);
    xlabel('n');
    legend('x[n]', 'y[n]'); title('Equação a diferenças finitas');
    hold OFF

end 

