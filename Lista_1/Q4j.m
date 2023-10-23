
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
subplot(2,1,1);
hold ON
plot(x); plot(y);
xlabel('n');
legend('x[n]', 'y[n]'); title('Equação a diferenças finitas');
hold OFF