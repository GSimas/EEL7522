clc; clear; close all
n=-40:1:40;


g1 = 0.9*(2.^n);
g2 = -0.6*0.5.^n;
g3 = zeros(81,1);
g3(41,1) = 0.7;
g3 = g3';
g = g3 + g2 + g1 ;

figure (1)
stem(n,g)
title('Resposta ao impulso de g[n]')

h1=-(1.964.*((0.8366).^n).*cos(0.9303*n+1.3508));

h3 = zeros(81,1);
h3(41,1) = 1.42;
h3 = h3';
h = h1 + h3;

figure (2)
stem(n,h)
title('Resposta ao impulso de h[n]')
y = conv(h, g, 'same');

figure (3)
stem(y)
title('Convolução de h[n] e g[n]')

figure (4)
freqz(g);
title('Magnitude e fase de g[n]')

figure (5)
freqz(h);
title('Magnitude e fase de h[n]')

figure (6)
freqz(y);
title('Magnitude e fase de h[n]*g[n]')
w = textread('DistortedSignal.txt');

figure (7);
freqz(w)
title('Sinal com distorção')
k = conv (g, w);

figure (8);
freqz(k)
title('Sinal filtrado')