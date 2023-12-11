clc
clear



H = tf([1 0 -1],[1]);
display(H)
subplot(2,1,1);
bode(H)
subplot(2,1,2);
pzmap(H)


residue([1], [1 3 2 0])