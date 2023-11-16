
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

figure(1);
Y = fft(x);
frequencies_y = linspace(0, fs/2, N/2);
figure(2);
subplot(2,1,1);
plot(frequencies_y, abs(Y(1:N/2)));

xlabel('Frequencia (Hz)');
ylabel('|X(f)|');

title('Transforma de Fourier de X');

hold OFF

a = 1;
b = [alfa (1-alfa)];
y2 = filter(b,a,x);
subplot(2, 1, 2);

Y = fft(y);
subplot(2,1,2);
plot(frequencies_y, abs(Y(1:N/2)));

ylabel('Frequencia (Hz)');
ylabel('|Y(f)|');
title('Transforma de Fourier de Y');

a = 1;
b = [alfa (1-alfa)];
y2 = filter(b,a,x);
subplot(2, 1, 2);


disp("Primeiro Som");
pause(1);
sound(x, fs);
disp("Segundo Som");
pause(1);
sound(y, fs);


audiowrite('teste.wav', y, fs, 'BitsPerSample',16);
info = audioinfo('teste.wav');
