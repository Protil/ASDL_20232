clear; clc; close all

syms s t zeta wn

obj = VideoWriter("Variação de Zeta", "MPEG-4");
obj.Quality = 100;
obj.FrameRate = 120;

% dominio de Laplace
H = ((wn^2)/(s^2 + 2*zeta*wn*s + wn^2))/s;

% resposta ao degrau no domínio do tempo
st = ilaplace(H, t);

open(obj)
for zetav = [0.001:0.001:4]
    figure(1);

    hold on;
    t1 = 0:0.1:20;
    if zetav == 1.0
        display("verdade")
        zetav = 1.0000001;
    end 

    display(zetav)
    cla;
    h1 = subs(st, {t, wn, zeta}, {t1 1 zetav}); % wn = 1, zeta = 0.1
    
    plot(t1, h1, "r");
        
    title("Sistema Linear de 2a ordem,")
    xlabel('\omega [rad/s]'); %veja como incluir letras gregas
    ylabel('Resposta ao degrau [\mua]');
    ylim([0 2])

    legend(sprintf('\\zeta = %i', zetav));
    hold off;
    writeVideo(obj, getframe(gcf));
    
end 
close(obj)


