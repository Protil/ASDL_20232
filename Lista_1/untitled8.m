obj = VideoWriter("Variação de Lu", "MPEG-4");

open(obj)

x = linspace(0,5,50);

y = x.^2;

axis([0 5 0 25]);

hold on

for i = 1:length(x)
    plot(x(1:i), y(1:i), "r")
    M(i) = getframe;
    pause(0.1);
end
writeVideo(obj, M);
close(obj)