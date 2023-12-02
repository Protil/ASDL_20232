clear; clc; close all

syms s t zeta wn

% dominio de Laplace
H = ((wn^2)/(s^2 + 2*zeta*wn*s + wn^2))/s;

% resposta ao degrau no domínio do tempo
st = ilaplace(H, t);

figure(1);
hold on;
t1 = 0:0.1:20;

h1 = subs(st, {t, wn, zeta}, {t1 1 0.1}); % wn = 1, zeta = 0.1
h2 = subs(st, {t, wn, zeta}, {t1 1 0.8}); % wn = 1, zeta = 0.8
h3 = subs(st, {t, wn, zeta}, {t1 1 1.1}); % wn = 1, zeta = 1.1

plot(t1, h1);
plot(t1, h2);
plot(t1, h3);

grid

title("Sistema Linear de 2a ordem,")
xlabel('\omega [rad/s]'); %veja como incluir letras gregas
ylabel('Resposta ao degrau [\mua]');

legend('\zeta = 0.1', '\zeta = 0.8', '\zeta = 1.1');
hold off;



