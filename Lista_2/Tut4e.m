clear 
clc 
close all
[re, im] = meshgrid(-1.5:0.02:1.5);
s = re + j*im;
zeta = 0.1;
wn = .5;
% Valor absolutod de H(s)
ModH = abs(wn^2 ./ (s.^2 + 2*zeta*wn.*s + wn^2));

mesh(re, im, ModH);
xlabel('re{s} = sigma'); ylabel('imag{s} = j\omega');
title('Magnitude de H(s)');

Den = [1 2*zeta*wn wn^2];

p = roots(Den)







